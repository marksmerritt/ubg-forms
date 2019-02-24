class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.references :form_type, foreign_key: true
      t.references :user, foreign_key: true
      t.jsonb :properties, null: false, default: {}

      t.timestamps
    end

    add_index :forms, :properties, using: :gin
  end
end
