class FormSubmissionMailer < ApplicationMailer
  default from: ENV["DEFAULT_MAILER_SENDER"]

  def email_form(form, pdf, user)
    @form = form
    @user = user
    attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf
    # mail(to: @user.email, subject: "Equipment Failure")
    mail(to: ENV["MY_EMAIL_ADDRESS"], subject: "Equipment Failure")
  end
end
