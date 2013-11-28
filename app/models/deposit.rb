class Deposit < ActiveRecord::Base
  attr_accessible :quality, :weight, :farm_id
  belongs_to :farm
  def self.all_qualities
    ["Very Good","Good","OK", "Bad", "Very Bad" ]
  end

end
