class AddLevelToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :level, :integer, default: 0
  end
end
