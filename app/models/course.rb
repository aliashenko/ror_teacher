class Course < ActiveRecord::Base
  has_many :courses_users
  has_many :users, through: :courses_users
  has_many :pages
  has_many :assignments

  def is_public?
    public == true
  end
end
