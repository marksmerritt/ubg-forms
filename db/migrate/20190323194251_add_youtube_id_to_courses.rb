class AddYoutubeIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :youtube_id, :string
  end
end
