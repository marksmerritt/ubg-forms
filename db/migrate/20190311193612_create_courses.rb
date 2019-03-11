class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :body
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
