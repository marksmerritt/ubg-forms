class RemoveRegistrationFromExams < ActiveRecord::Migration[5.2]
  def change
    remove_reference :exams, :registration, foreign_key: true
  end
end
