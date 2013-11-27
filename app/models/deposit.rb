class Deposit < ActiveRecord::Base
  attr_accessible :quality, :weight, :farm_id
  belongs_to :farm
end
