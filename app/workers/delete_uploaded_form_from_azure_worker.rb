require "azure_helper"

class DeleteUploadedFormFromAzureWorker
  include Sidekiq::Worker 

  def perform(filename)
    AzureHelper.delete_uploaded_form(filename)
  end
end