class Portal::FeedbacksController < Portal::BaseController
  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to root_path, notice: "Thanks for your feedback! We will review it and correct any issues!"
    else 
      render :new, notice: "An error occurred when trying to submit your feedback. Please try again."
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def resolve
    @feedback = Feedback.find(params[:id])
    @feedback.resolved!
    redirect_to feedbacks_path, notice: "The issue has been resolved!"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :description)
  end
end
