class FeedbackMailer < ApplicationMailer
  def email_feedback(user, feedback)
    @user = user
    @feedback = feedback
    mail(to: ENV["MY_EMAIL_ADDRESS"], subject: "New UM Site Feedback")
  end
end
