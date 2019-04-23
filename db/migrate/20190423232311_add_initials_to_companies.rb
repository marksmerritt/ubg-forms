class AddInitialsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :intials, :string
  end
end
