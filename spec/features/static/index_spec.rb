require 'rails_helper'

describe "home#index" do 
  it "is reachable" do 
    visit root_path
    expect(page.status_code).to eq(200)
  end
end 