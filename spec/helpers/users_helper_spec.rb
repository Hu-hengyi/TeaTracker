require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe UsersHelper do
  it "lists the user types" do
    expect(helper.user_types).to eq(["Admin", "Analyst", "Intern"])
  end

  it "returns the right resource name" do
    helper.resource_name.should be :user
  end

  it "returns a valid resource" do
    helper.resource.class.should be User
  end

  it "returns the right devise mapping" do
    helper.devise_mapping.class_name.should eq "User"
  end
end
