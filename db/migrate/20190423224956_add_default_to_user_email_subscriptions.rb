class AddDefaultToUserEmailSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :subscribed_to_emails, :boolean, default: true
  end
end
