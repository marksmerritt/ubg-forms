class AddDefaultToFormFieldsRequire < ActiveRecord::Migration[5.2]
  def change
    change_column_default :form_fields, :required, false
  end
end
