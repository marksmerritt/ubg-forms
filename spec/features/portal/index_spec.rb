require 'rails_helper'

describe "portal#index" do 
  describe "unauthenticated" do 
    it "should not be reachable by guests" do 
      visit portal_index_path
      expect(current_path).to_not eq(portal_index_path)
    end
  end
end