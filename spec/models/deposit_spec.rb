require 'spec_helper'

describe Deposit do

  it "detects duplicates if two entries are close together and close in weight" do
    weight = 20
    time = Time.now

    create(:deposit, weight: weight, weighed_at:time);
    deposit = create(:deposit,
                       weight: weight - 0.5*Deposit.weight_delta,
                   weighed_at: time + 0.5*Deposit.time_delta)
    deposit.possible_duplicate.should eq(true)
  end

  it "doesn't call close close weights at far apart times duplicates" do
    weight = 20
    time = Time.now

    create(:deposit, weight: weight, weighed_at:time);
    deposit = create(:deposit,
                     weight: weight - 0.5*Deposit.weight_delta,
                     weighed_at: time + 2.weeks)
    deposit.possible_duplicate.should eq(false)
  end

  it "doesn't call different weights at the same time duplicates" do
    weight = 20
    time = Time.now

    create(:deposit, weight: weight, weighed_at:time);
    deposit = create(:deposit,
                     weight: weight + 100*Deposit.weight_delta,
                     weighed_at: time + 0.001*Deposit.time_delta)
    deposit.possible_duplicate.should eq(false)
  end

  it "resolves possible errors" do
    deposit = create(:deposit, possible_duplicate: true)
    deposit.possible_duplicate?.should eq(true)
    deposit.resolve
    deposit.possible_duplicate?.should eq(false)
  end

end
