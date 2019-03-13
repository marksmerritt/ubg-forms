class AddJobNumberToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :job_number, :string
    add_index :forms, :job_number
  end
end
