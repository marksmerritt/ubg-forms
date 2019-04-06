class CreateFormUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :form_uploads do |t|
      t.references :user, foreign_key: true
      t.references :form_type, foreign_key: true

      t.timestamps
    end
  end
end
