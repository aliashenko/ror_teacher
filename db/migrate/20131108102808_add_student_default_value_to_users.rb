class AddStudentDefaultValueToUsers < ActiveRecord::Migration
  def up
    change_column :users, :user_type, :string, {:default => "student"}
  end

  def down
  end
end
