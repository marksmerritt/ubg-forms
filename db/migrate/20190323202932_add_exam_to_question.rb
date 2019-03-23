class AddExamToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :exam, foreign_key: true
  end
end
