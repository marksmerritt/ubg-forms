class AddStatusToFormTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :form_types, :status, :integer, default: 0
  end
end
