class AddStatusToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :status, :integer, default: 0
  end
end
