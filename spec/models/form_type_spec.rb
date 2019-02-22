require 'rails_helper'

RSpec.describe FormType, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form_type) }.to change{ FormType.count }.by(1)
    end
  end

  describe "validation" do 
    let(:form_type) { FactoryBot.build_stubbed(:form_type) }

    it "is not valid without a name" do 
      form_type.name = nil
      expect(form_type).to_not be_valid
    end
  end
end
