class RemoveAnswerBankFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :answer_bank, :json
  end
end
