require "azure_helper"

class DeleteFormFromAzureWorker
  include Sidekiq::Worker 

  def perform(filename)
    AzureHelper.delete_form(filename)
  end
end