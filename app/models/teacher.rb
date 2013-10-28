class Teacher < ActiveRecord::Base
  has_many :teachers_courses
  has_many :courses, through: :teachers_courses
end
