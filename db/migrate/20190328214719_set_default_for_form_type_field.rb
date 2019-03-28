class SetDefaultForFormTypeField < ActiveRecord::Migration[5.2]
  def change
    change_column :form_fields, :field_type, :string, default: "text_field"
  end
end
