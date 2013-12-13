class Course < ActiveRecord::Base
  has_many :courses_users
  has_many :users, through: :courses_users
  has_many :pages
  has_many :assignments

  validates :name, :public, presence: true
  def is_public?
    public == true
  end
end
