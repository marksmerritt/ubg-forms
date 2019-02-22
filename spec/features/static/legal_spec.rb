require 'rails_helper'

describe "legal pages" do  
  describe "privacy policy" do 
    it "is reachable from the homepage" do 
      visit root_path
      click_link "privacy-policy-link"
      expect(current_path).to eq(privacy_policy_path)
    end
  end

  describe "terms" do 
    it "is reachable from the homepage" do 
      visit root_path
      click_link "terms-link"
      expect(current_path).to eq(terms_path)
    end
  end
end