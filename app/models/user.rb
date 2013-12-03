class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses_users
  has_many :courses, through: :courses_users
  # validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_attached_file :avatar,
                    :styles => { large: "300x300>", small: "50x50#", thumb: "35x35#" },
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension",
                    :default_url => ActionController::Base.helpers.asset_path('small/missing.png')

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/png']

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
