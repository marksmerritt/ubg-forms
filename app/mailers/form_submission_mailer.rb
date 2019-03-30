class FormSubmissionMailer < ApplicationMailer
  default from: ENV["DEFAULT_MAILER_SENDER"]

  def email_form(form, pdf, user)
    @form = form
    @user = user
    attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf
    # mail(to: @user.email, subject: "Form Submission Successful")
    mail(to: ENV["MY_EMAIL_ADDRESS"], subject: "Form Submission Successful")
  end
end
