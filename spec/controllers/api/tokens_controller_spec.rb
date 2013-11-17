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

  it 'only excepts json requests' do
    post :create, { email: 'foo@lujeri.com', password: 'password' }
    expect(response.status).to eq(400)
  end

  it 'requires email and password' do
    post :create, { email: 'foo@lujeri.com', format: :json}
    expect(response.status).to eq(406)

    post :create, { password: 'password', format: :json }
    expect(response.status).to eq(406)
  end

  it 'requires email to refer to a registered user' do
    @user = Admin.create!(name: "FooMan", email: 'foo@lujeri.com', password: 'password')

    post :create, { email: 'bar@lujeri.com', password: 'password', format: :json}
    expect(response.status).to eq(401)
  end

  it 'only authenticates users with the correct password' do
    @user = Admin.create!(name: "FooMan", email: 'foo@lujeri.com', password: 'password')
    post :create, { email: 'foo@lujeri.com', password: 'drowssap', format: :json }
    expect(response.status).to eq(401)
  end

  it 'does not logout users without a valid token' do
    @user = Admin.create!(name: "FooMan", email: 'foo@lujeri.com', password: 'password')
    @user.ensure_authentication_token!
    token = @user.authentication_token
    @user.save!

    delete :destroy, { auth_token: "this is not a valid token" }
    expect(response.status).to eq(404)
    @user.reload
    @user.authentication_token.should eq(token)
  end

end
