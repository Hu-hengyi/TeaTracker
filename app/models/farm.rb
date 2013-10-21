class Farm < ActiveRecord::Base
  attr_accessible :bushes, :latitude, :longitude, :name, :notes, :workers
end
