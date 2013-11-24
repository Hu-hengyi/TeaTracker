require 'spec_helper'

describe "deposits/show" do
  before(:each) do
    @deposit = assign(:deposit, stub_model(Deposit,
      :weight => 1.5,
      :quality => "Quality"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/Quality/)
  end
end
