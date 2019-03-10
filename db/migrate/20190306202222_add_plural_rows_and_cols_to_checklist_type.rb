class AddPluralRowsAndColsToChecklistType < ActiveRecord::Migration[5.2]
  def change
    rename_column :checklist_types, :row, :rows
    rename_column :checklist_types, :col, :cols
  end
end
