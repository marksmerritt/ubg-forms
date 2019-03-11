class AddPropertiesToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :header_properties, :jsonb, default: {}
    add_column :forms, :checklist_properties, :jsonb, default: {}
    add_column :forms, :footer_properties, :jsonb, default: {}
  end
end
