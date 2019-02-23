class CreateFormFields < ActiveRecord::Migration[5.2]
  def change
    create_table :form_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.references :form_type, foreign_key: true

      t.timestamps
    end
  end
end
