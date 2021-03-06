class CoursesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :owner, class_name: User, foreign_key: "owner_id"
end
