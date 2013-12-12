class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references  :course
      t.string      :name
      t.text        :content
      t.timestamps
    end
  end
end
