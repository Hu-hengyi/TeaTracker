class Pickup < ActiveRecord::Base
  attr_accessible :weight, :timestamp
  belongs_to :farm

end
