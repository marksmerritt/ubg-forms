require 'rails_helper'

RSpec.describe FormField, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form_field) }.to change{ FormField.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:name) }

    it { should validate_inclusion_of(:field_type).
      in_array(FormField::FIELD_TYPE_OPTIONS) }
  end
end
