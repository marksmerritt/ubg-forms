class FormSubmissionMailer < ApplicationMailer
  def email_form(form, pdf, user)
    if user.subscribed_to_emails?
      @form = form
      @user = User.find_by_last_name("Klewe") || User.find_by_last_name("Merritt")
      attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf

      mail(to: @user.email, subject: "Equipment Failure")
    end
  end
end
