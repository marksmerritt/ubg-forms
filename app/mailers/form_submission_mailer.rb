class FormSubmissionMailer < ApplicationMailer
  def email_form(form, pdf)
    @user = User.find_by_last_name("Klewe") || User.find_by_last_name("Merritt")

    if @user.subscribed_to_emails?
      @form = form

      attachments["#{@form.form_type.name}_#{@form.id}.pdf"] = pdf

      if @form.images.attached?
        @form.images.each_with_index do |img, index|
          attachments["img_#{index}.#{img.content_type.split("/").last}"] = img.blob.download
        end
      end

      mail(to: @user.email, subject: "Equipment Failure - Job##{@form.job_number}")
    end
  end
end
