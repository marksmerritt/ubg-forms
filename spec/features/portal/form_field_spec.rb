require "rails_helper"

describe "navigation" do
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
  end
  
  describe "new" do 
    it "can be created when creating a form type" do 
      visit new_form_type_path
      fill_in "field-name", with: "Forklift Inspection"
      fill_in "form_type_fields_attributes_0_name", with: "Tires"
      find('#form_type_fields_attributes_0_field_type option:first-of-type').select_option
      find(:css, "#form_type_fields_attributes_0_required").set(true)

      expect{ click_button "Create" }.to change{ FormField.count }.by(1)
    end
  end
end