class AddChecklistToForms < ActiveRecord::Migration[5.2]
  def change
    add_reference :forms, :checklist, foreign_key: true
  end
end
