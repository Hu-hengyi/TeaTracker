require 'spec_helper'

describe "Access with valid token" do
  it "allows users to access pages with a valid token" do
    @user = create(:user)
    @user.skip_confirmation!
    @user.ensure_authentication_token!

    get farms_path, { auth_token: @user.authentication_token }
    expect(response).to be_success
  end

  it "does not allow users to access pages without a token" do
    @user = create(:user)
    @user.skip_confirmation!

    get farms_path
    response.status.should eq(302)
  end

  it "does not allow users to access pages with the wrong token" do
    @user = create(:user)
    @user.skip_confirmation!

    get farms_path, { auth_token: "foobar" }
    response.status.should eq(302)
  end
end