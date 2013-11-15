class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses_users
  has_many :courses, through: :courses_users
  validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_attached_file :avatar

  def is_student?
    user_type == "student"
  end

  def is_teacher?
    user_type == "teacher"
  end

  def has_course?(course)
    courses.include?(course)
  end

  def is_admin?
    admin == true
  end
end
