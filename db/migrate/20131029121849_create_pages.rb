class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :course_id
      t.timestamps
    end
  end
end
