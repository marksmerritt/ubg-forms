class FormSubmissionMailer < ApplicationMailer
  def email_form(form, pdf, user)
    if user.subscribed_to_emails?
      @form = form
      @user = user
      attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf

      # TODO: Only for testing purposes
      mail(to: @user.email, subject: "Equipment Failure")
    end
  end
end
