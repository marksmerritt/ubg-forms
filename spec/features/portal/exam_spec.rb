require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
  end

  describe "show" do
    before do 
      @exam = FactoryBot.create(:exam)
      @question1 = FactoryBot.create(:question, exam: @exam)
      @question2 = FactoryBot.create(:question2, exam: @exam)
    end

    it "displays a list of questions" do 
      visit exam_path(@exam)
      expect(page).to have_content(@question1.title).and have_content(@question2.title)
    end
  end
end