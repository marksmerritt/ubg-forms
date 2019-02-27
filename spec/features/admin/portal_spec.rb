require "rails_helper"

describe "navigation" do 
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
    visit dashboard_index_path
    click_link "link-admin-index"
  end

  describe "index" do 
    it "has a link to create a new form type" do 
      click_link "link-create-form-type"
      expect(current_path).to eq(new_form_type_path)
    end
  end
end