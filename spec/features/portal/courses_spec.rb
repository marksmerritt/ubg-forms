require "rails_helper"

describe "navigation" do
  let(:user) { FactoryBot.create(:user) }

  before do 
    login_as(user, :scope => :user)
  end

  describe "index" do
    it "can be reached from the homepage" do 
      visit root_path
      click_link "courses-index-link"
      expect(current_path).to eq(courses_path)
    end

    it "displays a list of courses the current user is registered for" do 
      @course = FactoryBot.create(:course)
      @registration = FactoryBot.create(:registration, course: @course, user: user)
      visit courses_path
      expect(page).to have_content(@course.title)
    end
  end

  describe "show" do 
    before do 
      @course = FactoryBot.create(:course)
      @registration = FactoryBot.create(:registration, course: @course, user: user)
    end

    it "can be reached from courses index" do 
      visit courses_path
      click_link "view-course-#{@course.id}"
      expect(current_path).to eq(course_path(@course.id))
    end
  end
end