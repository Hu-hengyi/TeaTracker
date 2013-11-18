module UsersHelper
  def user_types
    user_types = []
    User.subclasses.each {|sub| user_types << sub.name}
    user_types
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
