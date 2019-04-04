require 'rails_helper'

RSpec.describe FormType, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form_type) }.to change{ FormType.count }.by(1)
    end
  end

  describe "validation" do 
    before do 
      @form_type = FactoryBot.create(:scaffold_form_type)
    end

    it "has a name" do 
      @form_type.name = ""
      expect(@form_type).to_not be_valid
    end

    it "has a unique name" do 
      @form_type2 = FactoryBot.build_stubbed(:form_type, name: @form_type.name)
      expect(@form_type2).to_not be_valid
    end
  end
end
