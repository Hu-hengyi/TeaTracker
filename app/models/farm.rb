class Farm < ActiveRecord::Base
  attr_accessible :bushes, :latitude, :longitude, :name, :notes, :workers
   def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |farm|
        csv << farm.attributes.values_at(*column_names)
      end
    end
   end
   def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        farm = find_by_id(row["id"]) || new
        farm.attributes = row.to_hash.slice(*accessible_attributes)
        farm.save!
  end
end
end
