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

  describe "show" do 
    let(:form_type) { FactoryBot.create(:form_type) }

    it "displays the form type attributes" do 
      visit form_type_path(form_type)
      expect(page).to have_content(form_type.name)
    end
  end

  describe "new" do 
    it "can be created from the index page" do 
      visit form_types_path
      click_link "new-form-type"
      fill_in("field-name", with: "Forklift Inspection")
      expect{ click_button("create-form-type-btn") }.to change{ FormType.count }.by(1)
    end

    it "cannot be created with missing attributes" do 
      visit new_form_type_path
      expect{ click_button("create-form-type-btn") }.to change{ FormType.count }.by(0)
    end
  end

  describe "destroy" do 
    before do 
      @scaffold_form_type = FactoryBot.create(:scaffold_form_type) 
      @scaffold_html_id = "destroy-form-type-#{@scaffold_form_type.id}" 
    end

    it "can be destroyed from the index page" do 
      visit form_types_path
      expect{ click_link @scaffold_html_id }.to change{ FormType.count }.by(-1)
    end

    it "destroys the correct form type" do
      @forklift_form_type = FactoryBot.create(:forklift_form_type) 
      visit form_types_path
      click_link @scaffold_html_id
      expect(FormType.first.name).to eq(@forklift_form_type.name)
    end

    it "can be destroyed from its show page" do 
      visit form_type_path(@scaffold_form_type.id)
      expect{ click_link @scaffold_html_id }.to change{ FormType.count }.by(-1)
    end
  end
end














