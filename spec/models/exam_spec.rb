require 'rails_helper'

RSpec.describe Exam, type: :model do
  it "can be created with valid attributes" do 
    expect{ FactoryBot.create(:exam) }.to change{ Exam.count }.by(1)
  end

  describe "validations" do 
    let(:exam) { FactoryBot.build_stubbed(:exam) }

    it "has an associated course" do 
      exam.course = nil
      expect(exam).to_not be_valid
    end
  end
end
