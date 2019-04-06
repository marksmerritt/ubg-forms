# TODO: Store Uploaded Versions In Same Directory

require "pdf_generator"

module AzureHelper
  def self.create_client_instance
    Azure::Storage::Blob::BlobService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end

  def self.generate_filename(form)
    form_type = "#{form.form_type.name.gsub(' ', '-').downcase!}s"
    
    "#{form_type}/job##{form.job_number}--#{form.created_at.strftime('%Y-%m-%d')}--#{form.id}"
  end

  def self.send_form(form)
    client = create_client_instance
    container = ENV["AZURE_CONTAINER_NAME"]
    filename = generate_filename(form)
    content = PdfGenerator.generate(form)

    client.create_block_blob(container, filename, content)
  end

  def self.delete_form(filename)
    client = create_client_instance
    container = ENV["AZURE_CONTAINER_NAME"]
    
    client.delete_blob(container, filename)
  end
end
    

    
    

    