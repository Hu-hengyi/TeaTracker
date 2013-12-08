require 'spec_helper'

describe "users/index" do
  before(:each) do
    admin = create(:admin)
    intern = create(:intern, email: "intern@lujeri.com")
    @users = [admin, intern]
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
