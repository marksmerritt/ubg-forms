require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin_user) { FactoryBot.build_stubbed(:admin_user) }

  describe "validations" do 
    it "is valid with all required attributes present" do 
      expect{ FactoryBot.create(:admin_user) }.to change{ User.count }.by(1)
    end

    it "is not valid without a first name" do 
      admin_user.first_name = nil
      expect(admin_user).to_not be_valid
    end

    it "is not valid without a last name" do 
      admin_user.last_name = nil
      expect(admin_user).to_not be_valid
    end

    it "is not valid without a role" do 
      admin_user.role = nil
      expect(admin_user).to_not be_valid
    end
  end
end
