class AddStatusToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :status, :integer, default: 0
  end
end
