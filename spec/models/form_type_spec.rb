require 'rails_helper'

RSpec.describe FormType, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form_type) }.to change{ FormType.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
