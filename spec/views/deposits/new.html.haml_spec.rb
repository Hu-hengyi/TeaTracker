require 'spec_helper'

describe "deposits/new" do
  before(:each) do
    assign(:deposit, stub_model(Deposit,
      :weight => 1.5,
      :quality => "MyString"
    ).as_new_record)
  end

  it "renders new deposit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deposits_path, "post" do
      assert_select "input#deposit_weight[name=?]", "deposit[weight]"
      assert_select "select#deposit_quality[name=?]", "deposit[quality]"
    end
  end
end
