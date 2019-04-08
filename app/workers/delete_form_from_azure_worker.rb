require "azure_helper"

class DeleteFormFromAzureWorker
  include Sidekiq::Worker 

  def perform(filename, img_count)
    AzureHelper.delete_form(filename, img_count)
  end
end