class Portal::FeedbacksController < Portal::BaseController
  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end
end
