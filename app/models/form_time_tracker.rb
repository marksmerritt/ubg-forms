class FormTimeTracker < ApplicationRecord
  after_create :set_time_taken

  private 

  def set_time_taken
    time_diff = create_impression_at - new_impression_at
    update(time_taken: time_diff)
  end
end
