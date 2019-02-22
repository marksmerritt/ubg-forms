require 'rails_helper'

describe "dashboard navigation" do 
  describe "unauthenticated" do 
    it "should not be reachable by guests" do 
      visit dashboard_index_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end