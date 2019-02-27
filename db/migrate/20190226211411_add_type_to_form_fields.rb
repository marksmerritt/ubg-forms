class AddTypeToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :type, :string
  end
end
