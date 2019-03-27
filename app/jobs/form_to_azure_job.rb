# This should be refactored into seperate modules. 
# Given time constraints...leave as is but...

# TODO: Azure directories must be created dynamically based
# on form type. 


class FormToAzureJob < ApplicationJob
  queue_as :default

  def perform(form_id)
    form = Form.find(form_id)
    send_form(form)
  end

  def send_form(form)
    client = create_azure_instance
    share = "forms"
    form_type = "#{form.form_type.name.gsub!(' ', '_').downcase!}s"
    client.create_directory(share, form_type) unless form_type_dir_exists?(client, share, form_type)
    
    directory = form_type
    filename = "#{form_type}_#{form.id}"
    content = generate_pdf(form)

    file = client.create_file(share, directory, filename, content.size)
    client.put_file_range(share, directory, filename, 0, content.size - 1, content)
  end


  private

  def generate_pdf(form)
    av = ActionView::Base.new()
    av.view_paths = ActionController::Base.view_paths

    av.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end

    pdf = av.render pdf: "form_#{form.id}",
                    template: "portal/forms/pdf.html.erb",
                    layout: "layouts/pdf.html.erb",
                    locals: {
                      form: form,
                      form_type: form.form_type
                    }

    WickedPdf.new.pdf_from_string(pdf, :page_size => 'A4')
  end

  def create_azure_instance
    Azure::Storage::File::FileService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end

  def form_type_dir_exists?(client, share, form_type)
    client.list_directories_and_files(share, form_type).any?
  end
end
