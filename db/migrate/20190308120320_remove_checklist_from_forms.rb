class RemoveChecklistFromForms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :forms, :checklist, foreign_key: true
  end
end
