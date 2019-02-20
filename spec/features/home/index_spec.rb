require 'rails_helper'

describe "home pages" do 
  describe "index" do 
    it "is reachable" do 
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "home sub pages" do 
    let(:pages) { ["about_us", "services", "projects"] }

    it "is reachable from the homepage" do
      pages.each do |page| 
        visit root_path
        click_link "more-#{page}"
        expect(current_path).to eq(eval("#{page}_path"))
      end
    end
  end
end 