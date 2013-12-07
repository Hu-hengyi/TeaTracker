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
  end
end
