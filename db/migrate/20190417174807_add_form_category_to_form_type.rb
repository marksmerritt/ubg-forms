class AddFormCategoryToFormType < ActiveRecord::Migration[5.2]
  def change
    add_reference :form_types, :form_category, foreign_key: true
  end
end
