class CreateCoursesUsers < ActiveRecord::Migration
  def change
    create_table :courses_users do |t|
      t.integer :user_id
      t.integer :course_id

      t.integer :owner_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
