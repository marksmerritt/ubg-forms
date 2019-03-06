class AddChecklistTypeToChecklist < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :checklist_type, foreign_key: true
  end
end
