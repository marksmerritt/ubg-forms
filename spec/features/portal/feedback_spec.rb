# For Testing Purposes Only

require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
  end

  describe "new" do
    it "can be reached from the instructions page" do 
      visit dashboard_index_path
      click_link "link-provide-feedback"
      expect(current_path).to eq(new_feedback_path)
    end
  end
end