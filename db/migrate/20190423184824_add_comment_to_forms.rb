class AddCommentToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :comment, :text
  end
end
