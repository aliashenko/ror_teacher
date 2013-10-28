class CreateTeachersCourses < ActiveRecord::Migration
  def change
    create_table :teachers_courses do |t|
      t.integer :teacher_id
      t.integer :course_id
      t.timestamps
    end
  end
end
