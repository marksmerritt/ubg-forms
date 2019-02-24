require 'rails_helper'

RSpec.describe Form, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form) }.to change{ Form.count }.by(1)
    end
  end

  describe "validation" do 
  end
end
