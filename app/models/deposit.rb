class Deposit < ActiveRecord::Base
  @@WEIGHT_DELTA = 0.1
  @@TIME_DELTA = 5

  attr_accessible :quality, :weight, :farm_id, :cp_id
  belongs_to :farm
  belongs_to :cp
  def self.all_qualities
    ["Very Good","Good","OK", "Bad", "Very Bad" ]
  end

  # Returns all tea deposits that were entered within a given time delta of this deposit **AND**
  # have a weight within a given weight delta of this deposit.
  def might_be_erroneous
    Deposit.all(conditions: {
                  weight => (self.weight-@@WEIGHT_DELTA)..(self.weight + @@WEIGHT_DELTA),
                  weighed_at => (self.weighed_at-@@TIME_DELTA)..(self.weighed_at+@@TIME_DELTA)
                })
  end
end
