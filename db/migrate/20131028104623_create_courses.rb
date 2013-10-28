class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :public
      t.integer :assignment_id

      t.timestamps
    end
  end
end
