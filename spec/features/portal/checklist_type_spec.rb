require "rails_helper"

describe "navigation" do 
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
  end

  describe "new" do 
    it "can be created from the new page" do 
      visit new_checklist_type_path
      fill_in "field-name", with: "Pass or Fail"
      fill_in "field-cols", with: "Pass, Fail"
      fill_in "field-rows", with: "Brakes, Lights"

      expect{ click_button "submit-new-checklist-type" }.to change{ ChecklistType.count }.by(1)
    end 
  end
end