class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.jsonb :answer_bank, null: false, default: {}
      t.integer :correct_answer
      t.boolean :status

      t.timestamps
    end
  end
end
