require 'rails_helper'

RSpec.describe ChecklistType, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:checklist_type) }.to change{ ChecklistType.count }.by(1)
    end
  end
end