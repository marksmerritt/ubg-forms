require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
  end 

  describe "overview" do 
    let(:form) { FactoryBot.create(:form, user: user) }

    it "displays a list of recently submitted forms by the current user" do 
      visit form_overview_path
      expect(page).to have_content(form.properties.values.first)
    end
  end
end