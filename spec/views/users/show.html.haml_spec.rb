require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:admin, stub_model(Admin))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
