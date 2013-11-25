class Payment < ActiveRecord::Base
  attr_accessible :amount, :check_number, :paid
  belongs_to :farm
end
