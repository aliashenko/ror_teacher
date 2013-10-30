class User < ActiveRecord::Base
  has_many :courses_users
  has_many :courses, through: :courses_users
  validates :first_name, :last_name, :user_type, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }

  def is_student?
    user_type == "student"
  end

  def is_teacher?
    user_type == "teacher"
  end

end
