require "rails_helper"

describe "navigation" do 
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
    @scaffold_form_type = FactoryBot.create(:scaffold_form_type)
  end

  describe "index" do 
    it "is reachable from root" do 
      visit root_path
      click_link "help-index-link"
      expect(current_path).to eq(help_index_path)
    end
  end
end