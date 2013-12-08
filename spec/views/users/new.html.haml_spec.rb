require 'spec_helper'

describe "users/new" do
  before(:each) do
    create(:user)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
    end
  end
end
