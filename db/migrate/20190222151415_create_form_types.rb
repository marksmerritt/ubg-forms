class CreateFormTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :form_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
