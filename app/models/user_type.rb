class UserType < ActiveRecord::Base
  has_many :users

  attr_accessible :name #, :body

  def formatted_name
    return self.name.capitalize
  end

end
