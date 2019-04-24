class AddJobNumPrependToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :job_num_prepend, :string
  end
end
