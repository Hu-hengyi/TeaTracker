class Cp < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  has_many :deposits

   def self.getNumLeaves
     cps = Cp.all
     cpsInfo = [] 
     cps.each do |cp| 
       info = Hash.new
       info["name"] = cp.name 
       info["latititude"] = cp.latitude 
       info["longitude"] = cp.longitude
       info["leaves"] = self.getNumLeavesForCp(cp)
       cpsInfo << info
     end
     return cpsInfo
   end


   def self.getNumLeavesForCp(cp)       
     startDay = Time.now
     endDay = Time.parse("2013-12-07 13:23 -0800")
     deps = Deposit.find_all_by_cp_id(cp.id)
     total = 0
     deps.each do |deposit|
       total += deposit.weight
       time = deposit.weighed_at 
       if time < startDay
         startDay = time
       end
       if time > endDay
         endDay = time
       end
     end
     numDays = (endDay - startDay) / (24 * 60 * 60) + 1
     average = total/numDays
     if average<500
       return 1
     elsif average<1000
       return 2
     else
       return 3
     end
   end

end
