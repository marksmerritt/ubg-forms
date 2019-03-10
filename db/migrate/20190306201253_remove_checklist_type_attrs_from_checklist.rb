class RemoveChecklistTypeAttrsFromChecklist < ActiveRecord::Migration[5.2]
  def change
    remove_column :checklists, :col
    remove_column :checklists, :row
  end
end
