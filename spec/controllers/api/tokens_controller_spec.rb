require 'spec_helper'

describe Api::TokensController do

  it 'returns a valid token for a registered user' do
    @user = Admin.create!(name: "FooMan", email: 'foo@lujeri.com', password: 'password')
    post :create, { email: 'foo@lujeri.com', password: 'password', format: :json }
    expect(response).to be_success

    json = {token: User.first.authentication_token}.to_json
    response.body.should == json
  end

  it 'allows users to invalidate their tokens' do
    @user = Admin.create!(name: "FooMan", email: 'foo@lujeri.com', password: 'password')
    @user.ensure_authentication_token!
    token = @user.authentication_token
    @user.save!

    delete :destroy, { auth_token: @user.authentication_token }
    @user.reload
    @user.authentication_token.should_not eq(token)
  end

end
