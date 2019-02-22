require "rails_helper"

describe "navigation" do 
  describe "new" do 
    describe "admin user signed in" do 
      let(:admin_user) { FactoryBot.create(:admin_user) }

      before do 
        login_as(admin_user, :scope => :user)
      end

      it "can be created" do 
        visit new_form_type_path
        fill_in("field-name", with: "Forklift Inspection")
        expect{ click_button("create-form-type-btn")}.to change{ FormType.count }.by(1)
      end
    end

    describe "employee user" do 
      let(:employee_user) { FactoryBot.create(:employee_user) }

      before do 
        login_as(employee_user, :scope => :user)
      end

      it "cannot be created" do 
        visit new_form_type_path
        expect(current_path).to_not eq(new_form_type_path)
      end
    end
  end

  describe "show" do 
    let(:form_type) { FactoryBot.create(:form_type) }
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before do 
      login_as(admin_user, :scope => :user)
    end

    it "displays the form type attributes" do 
      visit form_type_path(form_type)
      expect(page).to have_content(form_type.name)
    end
  end
end