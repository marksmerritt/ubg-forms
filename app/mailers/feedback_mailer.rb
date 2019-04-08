class FeedbackMailer < ApplicationMailer
  default from: ENV["DEFAULT_MAILER_SENDER"]

  def email_feedback(user, feedback)
    @user = user
    @feedback = feedback
    mail(to: ENV["MY_EMAIL_ADDRESS"], subject: "New UM Site Feedback")
  end
end
