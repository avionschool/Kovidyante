class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_role, :boolean
    add_column :users, :teacher_role, :boolean
    add_column :users, :student_role, :boolean
  end
end
