require 'spec_helper'

describe "deposits/edit" do
  before(:each) do
    @deposit = assign(:deposit, stub_model(Deposit,
      :weight => 1.5,
      :quality => Deposit.all_qualities[0]
    ))
  end

  it "renders the edit deposit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deposit_path(@deposit), "post" do
      assert_select "input#deposit_weight[name=?]", "deposit[weight]"
      assert_select "select#deposit_quality[name=?]", "deposit[quality]"
    end
  end
end
