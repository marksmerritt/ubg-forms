require 'rails_helper'

describe "legal pages" do 
  legal_pages = ["privacy_policy", "terms"] 

  it "is reachable from the homepage" do 
    legal_pages.each do |page|
      visit root_path
      click_link "#{page}-link"
      expect(current_path).to eq(eval("#{page}_path"))
    end
  end
end