class Cp < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  has_many :deposits
end
