require "rails_helper"

describe "navigation" do 
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
    @scaffold_form_type = FactoryBot.create(:scaffold_form_type)
  end

  describe "index" do 
    it "displays a list of form types" do 
      @forklift_form_type = FactoryBot.create(:forklift_form_type) 
      
      visit form_types_path
      expect(page).to have_content(@scaffold_form_type.name).and have_content(@forklift_form_type.name)
    end
  end

  describe "update" do 
    it "can be updated from the index page" do 
      visit form_types_path
      click_link "edit-form-type-#{@scaffold_form_type.id}"
      fill_in "field-form-type-name", with: "Something Else"
      click_button "Update"
      expect(@scaffold_form_type.reload.name).to eq("Something Else")
    end
  end
end














