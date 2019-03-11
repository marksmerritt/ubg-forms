class RemovePropertiesFromForms < ActiveRecord::Migration[5.2]
  def change
    remove_column :forms, :properties, :jsonb
  end
end
