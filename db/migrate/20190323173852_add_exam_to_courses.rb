class AddExamToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :exam, foreign_key: true
  end
end
