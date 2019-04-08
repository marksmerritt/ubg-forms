require "azure_helper"

class EmailFeedbackWorker
  include Sidekiq::Worker 

  def perform(feedback_id)
    feedback = Feedback.find(feedback_id)
    user = feedback.user
    FeedbackMailer.email_feedback(user, feedback)
  end
end