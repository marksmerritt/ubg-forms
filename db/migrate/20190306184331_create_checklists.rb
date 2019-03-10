class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.text :col, array: true, default: []
      t.text :row, array: true, default: []
      t.jsonb :properties, null: false, default: {}

      t.timestamps
    end
  end
end
