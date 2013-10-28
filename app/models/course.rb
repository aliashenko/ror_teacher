class Course < ActiveRecord::Base
  has_many :students_courses
  has_many :teachers_courses
  has_many :students, through: :students_courses
  has_many :teachers, through: :teachers_courses
end
