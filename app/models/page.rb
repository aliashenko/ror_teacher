class Page < ActiveRecord::Base
  belongs_to :course

  validates :course_id, presence: true
  validates :name,      presence: true, length: { maximum: 15 }
  validates :content,   length: { maximum: 1000 }
end
