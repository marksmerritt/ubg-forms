class AddTimeTakenToFormTimeTracker < ActiveRecord::Migration[5.2]
  def change
    add_column :form_time_trackers, :time_taken, :float
  end
end
