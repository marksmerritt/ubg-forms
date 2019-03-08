class AddChecklistTypeToFormType < ActiveRecord::Migration[5.2]
  def change
    add_reference :form_types, :checklist_type, foreign_key: true
  end
end
