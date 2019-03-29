# require "rails_helper"

# describe "navigation" do
#   let(:user) { FactoryBot.create(:user) }

#   before do 
#     login_as(user, :scope => :user)
#   end

#   describe "index" do
#     it "can be reached from the homepage" do 
#       visit root_path
#       click_link "courses-index-link"
#       expect(current_path).to eq(courses_path)
#     end

#     it "displays a list of courses the current user is registered for" do 
#       @course = FactoryBot.create(:course)
#       @registration = FactoryBot.create(:registration, course: @course, user: user)
#       visit courses_path
#       expect(page).to have_content(@course.title)
#     end
#   end

#   describe "show" do 
#     before do 
#       @course = FactoryBot.create(:course)
#       @course.exam = FactoryBot.create(:exam)
#       @registration = FactoryBot.create(:registration, course: @course, user: user)
#     end

#     it "can be reached from courses index" do 
#       visit courses_path
#       click_link "view-course-#{@course.id}"
#       expect(current_path).to eq(course_path(@course.id))
#     end

#     it "displays the course title" do 
#       visit course_path(@course)
#       expect(page).to have_content(@course.title)
#     end

#     it "displays the course body" do 
#       visit course_path(@course)
#       expect(page).to have_content(@course.body)
#     end

#     it "displays a link to the exam" do 
#       visit course_path(@course)
#       click_link "exam-#{@course.id}-link"
#       expect(current_path).to eq(exam_path(@course.exam))
#     end
#   end
# end