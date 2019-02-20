class AddDefaultRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :role, 0
  end
end
