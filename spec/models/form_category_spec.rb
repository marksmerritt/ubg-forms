require 'rails_helper'

RSpec.describe FormCategory, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form_category) }.to change{ FormCategory.count }.by(1)
    end
  end

  describe "validation" do 
    let(:form_category) { FactoryBot.create(:form_category) }

    it "has a name" do 
      form_category.name = nil
      expect(form_category).to_not be_valid
    end
  end
end
