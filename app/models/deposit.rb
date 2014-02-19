class Deposit < ActiveRecord::Base
  attr_accessible :quality, :weight, :farm_id, :cp_id, :weighed_at, :possible_duplicate
  belongs_to :farm
  belongs_to :cp
  before_create :check_for_erroneous_input

  validates_presence_of :weight, :weighed_at, :cp, :farm
  validates :weight, :numericality => {:greater_than_or_equal_to => 0}
  validates_associated :cp, :farm

  def self.all_qualities
    ["Very Good","Good","OK", "Bad", "Very Bad" ]
  end

  def days_since
    next_td = Deposit.find(:first, :order => "weighed_at DESC", :conditions => [ "farm_id = ? AND weighed_at < ?", self.farm_id, self.weighed_at])
    if next_td == nil
      return -1
    else
      return (self.weighed_at - next_td.weighed_at).to_i / 1.day
    end
  end


  # Sets possible_duplicate to true if it finds another deposit entered within
  # a given time delta of this deposit **AND** have a weight within a given
  # weight delta of this deposit.
  def check_for_erroneous_input
    dw = Deposit.weight_delta
    dt = Deposit.time_delta

    possible_duplicates = Deposit.all(conditions: {
                 :weight => (self.weight - dw)..(self.weight + dw),
             :weighed_at => (self.weighed_at - dt)..(self.weighed_at + dt)
    })
    self.possible_duplicate = true unless possible_duplicates.empty?
  end

  def self.weight_delta
    0.4
  end

  def self.time_delta
    5
  end

  def resolve
    self.possible_duplicate = false
  end

  def self.to_csv(deposits = all)
    CSV.generate do |csv|
      csv << column_names
      deposits.each do |deposit|
        csv << deposit.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      deposit = find_by_id(row["id"]) || new
      deposit.attributes = row.to_hash.slice(*accessible_attributes)
      deposit.save!
    end
  end

end
