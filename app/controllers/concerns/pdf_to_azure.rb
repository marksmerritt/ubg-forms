# TODO: Move to Background Job

# Current implementation is for testing purposes before we gather more
# information from the client. 
# The solution uploads a copy of a PDF version of a form to Azure's
# file storage service (dummy account).


require "active_support/concern"

module PdfToAzure
  extend ActiveSupport::Concern 

  def send_pdf_to_azure(form)
    unless Rails.env.test?
      share = "forms"
      directory = "forklift_inspections"
      filename = "form_#{form.id}"
      content = generate_pdf(form)
      client = create_azure_instance
      
      file = client.create_file(share, directory, filename, content.size)
      client.put_file_range(share, directory, filename, 0, content.size - 1, content)
    end
  end

  def generate_pdf(form)
    render_to_string pdf: "form_#{form.id}",
                     template: "portal/forms/pdf.html.erb"

  end

  def create_azure_instance
    Azure::Storage::File::FileService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end
end