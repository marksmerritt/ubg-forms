require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:question) }.to change{ Question.count }.by(1)
    end
  end

  describe "validation" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:correct_answer) }
    it { should validate_presence_of(:answer_bank) }
  end
end
