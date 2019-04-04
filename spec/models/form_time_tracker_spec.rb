require 'rails_helper'

RSpec.describe FormTimeTracker, type: :model do
  describe "time_taken" do 
    it "sets the correct time taken on creation" do 
      @form_time = FactoryBot.create(:form_time_tracker, 
                                     new_impression_at: 10.minutes.ago,
                                     create_impression_at: Time.now)

      expect(@form_time.time_taken.floor).to eq(600)
    end
  end
end

