class User < ActiveRecord::Base
  has_many :courses_users
  has_many :courses, through: :courses_users

  def is_student?
    user_type == "student"
  end

  def is_teacher?
    user_type == "teacher"
  end

end
