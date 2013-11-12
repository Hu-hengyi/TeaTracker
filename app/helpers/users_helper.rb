module UsersHelper
  def user_types
    user_types = []
    User.subclasses.each {|sub| user_types << sub.name}
    user_types
  end
end
