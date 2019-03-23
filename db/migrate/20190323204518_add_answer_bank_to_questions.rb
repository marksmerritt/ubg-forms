class AddAnswerBankToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer_bank, :text, array: true, default: []
  end
end
