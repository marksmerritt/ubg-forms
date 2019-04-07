class AddJobNumberToFormUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :form_uploads, :job_number, :string
  end
end
