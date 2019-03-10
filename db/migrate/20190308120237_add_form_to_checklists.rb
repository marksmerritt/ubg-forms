class AddFormToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :form, foreign_key: true
  end
end
