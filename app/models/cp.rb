class Cp < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  has_many :deposits

  def self.to_csv(cps = all)
    CSV.generate do |csv|
      csv << column_names
      cps.each do |cp|
        csv << cp.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      cp = find_by_id(row["id"]) || new
      cp.attributes = row.to_hash.slice(*accessible_attributes)
      cp.save!
    end
  end

end
