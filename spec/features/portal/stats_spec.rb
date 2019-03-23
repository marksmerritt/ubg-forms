require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
  end

  describe "index" do
    it "is reachable from root" do 
      visit root_path
      click_link "stats-overview-link"
      expect(current_path).to eq(stats_path)
    end
  end
end