class FeedbackMailer < ApplicationMailer
  def email_feedback(user, feedback)
    @user = user
    @feedback = feedback
    mail(to: "markmerritt804@gmail.com", subject: "New UM Site Feedback")
  end
end
