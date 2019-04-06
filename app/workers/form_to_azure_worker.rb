require "azure_helper"

class FormToAzureWorker
  include Sidekiq::Worker 

  def perform(form_id)
    form = Form.find(form_id)
    AzureHelper.send_form(form)
  end
end