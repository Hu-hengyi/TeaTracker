class Deposit < ActiveRecord::Base
  attr_accessible :quality, :weight
  belongs_to :farm
end
