# TODO: 
# - No need to pass in user
# - Check if SD is subscribed to emails
# - RAM consumption for forms with many attached images

class FormSubmissionMailer < ApplicationMailer
  def email_form(form, pdf, user)
    @form = form
    # TODO: Remove (for testing purposes only)
    # @user = User.find_by_last_name("Klewe") || User.find_by_last_name("Merritt")
    @user = User.find_by_last_name("Merritt")
    attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf

    if @form.images.attached?
      @form.images.each_with_index do |img, index|
        attachments["img_#{index}"] = img.blob.download
      end
    end

    mail(to: @user.email, subject: "Equipment Failure")
  end
end
