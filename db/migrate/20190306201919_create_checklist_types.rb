class CreateChecklistTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_types do |t|
      t.string :name
      t.text :col, array: true, default: []
      t.text :row, array: true, default: []

      t.timestamps
    end
  end
end
