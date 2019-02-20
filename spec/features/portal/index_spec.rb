require 'rails_helper'

describe "portal#index" do 
  it "can be reached from the root page" do 
    visit root_path
    click_link "portal-index-link"
    expect(current_path).to eq(portal_index_path)
  end
end