# TODO: Refactor

require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
    @form_type = FactoryBot.create(:form_type)
    @form_type.fields << FormField.create(name: "brakes", field_type: "text_field", required: false )
  end

  describe "new" do 
    it "can be created from form overview page" do 
      visit form_overview_path
      click_link "create-new-form-#{@form_type.id}"
      fill_in "form_properties_#{@form_type.fields.first.name}", with: "Something"

      expect{ click_button("Create") }.to change{ Form.count }.by(1)
    end
  end

  describe "when a form exists" do 
    before do 
      @form = Form.create(form_type: @form_type, user: user, properties: { brakes: "some value" })
      @form_type.forms << @form
      visit form_type_form_path(@form_type, @form)
    end

    describe "edit" do 
      it "can be edited from the show page" do 
        click_link "edit-form-#{@form.id}"
        fill_in "form_properties_#{@form_type.fields.first.name}", with: "some other value"
        click_button "Update"

        expect(@form.reload.properties[@form_type.fields.first.name]).to eq("some other value")
      end
    end

    describe "destroy" do 
      it "can be destroyed from the show page" do 
        expect{ click_link "destroy-form-#{@form.id}" }.to change{ Form.count }.by(-1)
      end
    end
  end
end