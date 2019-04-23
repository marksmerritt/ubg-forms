class RemoveCommentsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments, force: :cascade
  end
end
