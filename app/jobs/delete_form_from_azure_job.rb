class DeleteFormFromAzureJob < ApplicationJob
  queue_as :default

  def perform(form_id)
    form = Form.find(form_id)
    delete_form(form)
  end

  def delete_form(form)
    client = create_azure_instance
    form_type = "#{form.form_type.name.gsub!(' ', '-').downcase!}s"
    filename = "#{form_type}_#{form.id}"

    client.delete_blob(form_type, filename)
  end


  private

  def create_azure_instance
    Azure::Storage::Blob::BlobService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end
end