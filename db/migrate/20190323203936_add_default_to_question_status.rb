class AddDefaultToQuestionStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :status, :integer, default: 0
  end
end
