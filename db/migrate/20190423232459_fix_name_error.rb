class FixNameError < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :intials, :initials
  end
end
