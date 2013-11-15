class Api::TokensController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  # Given a legit email and pass, create and return a valid token
  def create
    email = params[:email]
    password = params[:password]

    unless request.format == :json
      render status: 400, json: {message: "Invalid request format"}
      return
    end

    if email.nil? or password.nil?
      render status: 406, json: {message: "Email/Password cannot be blank"}
      return
    end

    @user = User.find_by_email(email.downcase)

    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email or passoword."}
      return
    end

    @user.ensure_authentication_token!

    if @user.valid_password?(password)
      render :status=>200, :json=>{:token=>@user.authentication_token}
    else
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:auth_token])
    if @user.nil?
      logger.info("Tried to delete, token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end
end
