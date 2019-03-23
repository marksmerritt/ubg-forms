class ChangeQuestionStatusDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :status, :integer, using: "status::integer"
  end
end
