class RemoveExamFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_reference :courses, :exam, foreign_key: true
  end
end
