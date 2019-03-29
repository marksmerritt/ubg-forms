require 'rails_helper' 

describe "user sign in" do
  before do 
    @user = FactoryBot.create(:admin_user)
  end

  describe "successful sign in" do 
    before do 
      visit root_path
    end

    it "redirects to form overview page" do 
      fill_in("field-email", with: @user.email)
      fill_in("field-password", with: "helloworld")
      click_button("sign-in-submit")
      expect(current_path).to eq(form_overview_path)
    end
  end
end