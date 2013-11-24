require 'spec_helper'

describe "deposits/index" do
  before(:each) do
    assign(:deposits, [
      stub_model(Deposit,
        :weight => 1.5,
        :quality => "Quality"
      ),
      stub_model(Deposit,
        :weight => 1.5,
        :quality => "Quality"
      )
    ])
  end

  it "renders a list of deposits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Quality".to_s, :count => 2
  end
end
