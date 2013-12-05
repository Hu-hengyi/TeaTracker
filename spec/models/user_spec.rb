require 'spec_helper'

describe User do

  it "should detect matching passwords" do
    user1 = create(:user, email: "match@lujeri.com")
    user2 = create(:user, email: "different@lujeri.com")
    user3 = create(:user, email: "no@password.com")

    user1.password = user1.password_confirmation = "same"
    user2.password = "different"
    user2.password_confirmation = "tnereffid"
    user3.password = ""

    user1.password_match?.should be(true)
    user2.password_match?.should be(false)
    user3.password_match?.should be(false)
  end

  it "should require a password to make changes" do
    user1 = create(:user, email: "new@user.com")
    user2 = create(:user, email: "existing@user.com")

    user1.password_required?.should be(false)
    user2.skip_confirmation!
    user2.password_required?.should be(true)
  end

  describe "Password Required" do
    it "doesn't require a password from a new user" do
      user = build(:user)
      user.password_required?.should be(false)
    end

    it "requires a password from an existing user" do
      user = create(:user)
      user.password_required?.should be(false)
    end
  end

  it "assigns new auth tokens" do
    user = create(:user)
    token = user.authentication_token

    user.reset_token!
    user.authentication_token.should_not eq(token)
  end

end
