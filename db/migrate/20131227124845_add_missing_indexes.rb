class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :assignments, :course_id
    add_index :courses_users, :user_id
    add_index :courses_users, :course_id
    add_index :courses_users, :owner_id
    add_index :courses_users, [:course_id, :user_id]
    add_index :pages, :course_id
  end
end
