class AddSubscribedToEmailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribed_to_emails, :boolean
  end
end
