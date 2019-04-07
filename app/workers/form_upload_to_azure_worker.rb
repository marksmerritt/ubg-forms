require "azure_helper"

class FormUploadToAzureWorker
  include Sidekiq::Worker 

  def perform(form_upload_id)
    form_upload = FormUpload.find(form_upload_id)
    AzureHelper.send_uploaded_form(form_upload)
  end
end