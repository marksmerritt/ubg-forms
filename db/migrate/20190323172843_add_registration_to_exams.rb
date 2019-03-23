class AddRegistrationToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :registration, foreign_key: true
  end
end
