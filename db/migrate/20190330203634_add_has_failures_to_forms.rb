class AddHasFailuresToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :has_failures, :boolean
  end
end
