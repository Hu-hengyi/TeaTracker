require 'spec_helper'

describe "deposits/show" do
  before(:each) do
    @deposit = create(:deposit)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/#{@deposit.weight}/)
    rendered.should match(/#{@deposit.quality}/)
  end
end
