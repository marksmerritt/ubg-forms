require "rails_helper"

describe "navigation" do
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
  end

  describe "new" do
    context "when header and footer fields are provided" do  
      it "can be created when creating a form type" do 
        visit form_types_path
        click_link "new-form-type"
        fill_in "field-form-type-name", with: "Forklift Inspection"
        fill_in "form_type_header_fields_attributes_0_name", with: "Tires"
        find('#form_type_header_fields_attributes_0_field_type option:first-of-type').select_option
        find(:css, "#form_type_header_fields_attributes_0_required").set(true)

        fill_in "form_type_footer_fields_attributes_0_name", with: "Comments"
        find('#form_type_footer_fields_attributes_0_field_type option:last-of-type').select_option

        expect{ click_button "Create" }.to change{ FormField.count }.by(2)
      end
    end
  end

  context "when no fields are provided" do 
    it "cannot be created" do 
      visit new_form_type_path
      expect{ click_button "Create" }.to change{ FormField.count }.by(0)
    end
  end
end