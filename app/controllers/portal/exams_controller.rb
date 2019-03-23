class Portal::ExamsController < Portal::BaseController
  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end
end
