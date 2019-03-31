class CreateFormTimeTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :form_time_trackers do |t|
      t.datetime :new_impression_at
      t.datetime :create_impression_at

      t.timestamps
    end
  end
end
