require "rails_helper"

describe "navigation" do 
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do 
    login_as(admin_user, :scope => :user)
  end

  describe "index" do 
    it "displays a list of form types" do 
      @scaffold_form_type = FactoryBot.create(:scaffold_form_type) 
      @forklift_form_type = FactoryBot.create(:forklift_form_type) 
      
      visit form_types_path
      expect(page).to have_content(@scaffold_form_type.name).and have_content(@forklift_form_type.name)
    end
  end

  describe "new" do 
    it "can be created from the index page" do 
      visit form_types_path
      click_link "new-form-type"
      fill_in("field-name", with: "Forklift Inspection")
      expect{ click_button("Create") }.to change{ FormType.count }.by(1)
    end

    it "cannot be created with missing attributes" do 
      visit new_form_type_path
      expect{ click_button("Create") }.to change{ FormType.count }.by(0)
    end
  end

  describe "update" do 
    it "can be updated from the index page" do 
      @scaffold_form_type = FactoryBot.create(:scaffold_form_type) 
      visit form_types_path
      click_link "edit-form-type-#{@scaffold_form_type.id}"
      fill_in "field-name", with: "Something Else"
      click_button "Update"
      expect(@scaffold_form_type.reload.name).to eq("Something Else")
    end
  end
end














