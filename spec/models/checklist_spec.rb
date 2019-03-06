require 'rails_helper'

RSpec.describe Checklist, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:checklist) }.to change{ Checklist.count }.by(1)
    end
  end
end
