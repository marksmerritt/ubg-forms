require "azure_helper"

class FormToAzureWorker
  include Sidekiq::Worker 

  def perform(form_id)
    form = Form.find(form_id)
    AzureHelper.send_form(form)

    if form.has_failures
      FormSubmissionMailer.email_form(form, content, form.user).deliver_now
    end
  end
end