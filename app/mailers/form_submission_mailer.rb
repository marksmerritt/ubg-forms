# TODO: Send Email to Admin Users Instead of the Form Owner. 
# Only send if subscribed to email notifications.

class FormSubmissionMailer < ApplicationMailer
  default from: ENV["DEFAULT_MAILER_SENDER"]

  def email_form(form, pdf, user)
    if user.subscribed_to_emails?
      @form = form
      @user = user
      attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf

      # TODO: Only for testing purposes

      mail(to: @user.email, subject: "Equipment Failure")
      # mail(to: ENV["MY_EMAIL_ADDRESS"], subject: "Equipment Failure")
    end
  end
end
