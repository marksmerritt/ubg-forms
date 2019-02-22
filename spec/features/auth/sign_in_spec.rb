require 'rails_helper' 

describe "user sign in" do
  before do 
    @user = FactoryBot.create(:admin_user)
  end

  it "can be done via the root page" do 
    visit root_path
    click_link "sign-in-btn"
    expect(current_path).to eq(new_user_session_path)
  end

  describe "successful sign in" do 
    it "redirects to dashboard index" do 
      visit new_user_session_path
      fill_in("field-email", with: @user.email)
      fill_in("field-password", with: "helloworld")
      click_button("sign-in-submit")
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end