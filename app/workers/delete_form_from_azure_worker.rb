class DeleteFormFromAzureWorker
  include Sidekiq::Worker 

  def perform(form_identifier)
    delete_form(form_identifier)
  end

  def delete_form(form_identifier)
    identifiers = form_identifier.split("_")

    container = identifiers[0].gsub(' ', '-').downcase + "s"
    form_id = identifiers[1]

    filename = "#{container}_#{form_id}"

    client = create_azure_instance
    client.delete_blob(container, filename)
  end


  private

  def create_azure_instance
    Azure::Storage::Blob::BlobService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end
end