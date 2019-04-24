class AddCompanyToForms < ActiveRecord::Migration[5.2]
  def change
    add_reference :forms, :company, foreign_key: true
  end
end
