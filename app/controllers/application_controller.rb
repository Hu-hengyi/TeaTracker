class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user_from_token!

  # Given that :user_id and :user_token are in the params,
  # and that :user_token is a valid token for the user with id = :user_id
  # allows the user access to content.
  def authenticate_user_from_token!
    user_id = params[:user_id].presence
    user       = user_id && User.find_by_id(user_id)

    unless user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      authenticate_user!
    end
  end

end
