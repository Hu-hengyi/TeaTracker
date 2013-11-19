require "spec_helper"

describe ConfirmationsController do
  it "prompts a new user to add a password" do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    user = create(:user, email: "foo@bar.com")
    get :show, {:confirmation_token => user.confirmation_token}
    response.should render_template(:show)
  end

  it "offers to resend confirmation instructions" do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    user = create(:user, email: "foo@bar.com")
    user.skip_confirmation!
    get :show
    response.should render_template('devise/confirmations/new')
  end

  it "confirms a user with a valid confirmation token" do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    user = create(:user, email: "foo@bar.com")
    get :confirm, {user: {:confirmation_token => user.confirmation_token,
                          :password => 'password',
                          :password_confirmation => 'password'}}
    user.reload
    user.confirmed?.should be(true)
    user.password.should eq 'password'
  end

  it "confirms a user with a valid confirmation token" do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    user = create(:user, email: "foo@bar.com")
    get :confirm, {user: {:confirmation_token => user.confirmation_token,
                          :password => 'password',
                          :password_confirmation => 'drowssap'}}
    user.reload
    user.confirmed?.should be(false)
  end

  end