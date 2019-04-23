class DropCommentTable < ActiveRecord::Migration[5.2]
  if Rails.env.development?
    def change
      drop_table :comments, force: :cascade
    end
  end
end
