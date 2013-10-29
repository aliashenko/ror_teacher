class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.string :assignment_type
      t.string :name

      t.timestamps
    end
  end
end
