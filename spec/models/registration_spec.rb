require 'rails_helper'

RSpec.describe Registration, type: :model do
  it "can be created with valid attributes" do 
    expect{ FactoryBot.create(:registration) }.to change{ Registration.count }.by(1)
  end

  describe "validation" do 
    let(:registration) { FactoryBot.build_stubbed(:registration) }

    it "has an associated User" do 
      registration.user = nil
      expect(registration).to_not be_valid
    end

    it "has an associated Course" do 
      registration.course = nil
      expect(registration).to_not be_valid
    end
  end
end
