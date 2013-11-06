class User < ActiveRecord::Base
  belongs_to :user_type

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type, :real_name, :user_type_id
  # attr_accessible :title, :body

  validates_presence_of :real_name, :email, :password
  validates_associated :user_type

  def admin?
    self.user_type == UserType.find_by_name('admin')
  end

  def analyst?
    self.user_type == UserType.find_by_name('analyst')
  end

  def intern?
    self.user_type == UserType.find_by_name('intern')
  end

end
