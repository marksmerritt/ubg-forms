require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:feedback) }.to change{ Feedback.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
