class CreateFormCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :form_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
