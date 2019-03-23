class AddCourseToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :course, foreign_key: true
  end
end
