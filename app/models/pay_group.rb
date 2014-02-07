class PayGroup < ActiveRecord::Base
  attr_accessible :name, :notes
  has_many :farms


end
