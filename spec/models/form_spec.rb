require 'rails_helper'

RSpec.describe Form, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:form) }.to change{ Form.count }.by(1)
    end
  end

  describe "validation" do 
    let(:form) { FactoryBot.create(:form) }

    it "has a job number" do 
      form.job_number = nil
      expect(form).to_not be_valid
    end
  end
end
