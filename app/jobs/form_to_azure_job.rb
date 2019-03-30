# TODO: Refactor

class FormToAzureJob < ApplicationJob
  queue_as :default

  def perform(form_id)
    form = Form.find(form_id)
    send_form(form)
  end

  def send_form(form)
    client = create_azure_instance
    form_type = "#{form.form_type.name.gsub(' ', '-').downcase!}s"

    # Create an Azure container using the form type name unless it already exists
    client.create_container(form_type) unless container_exists?(client, form_type)

    # TODO: Change filename based on client preference
    filename = "#{form_type}_#{form.id}"
    content = generate_pdf(form)

    client.create_block_blob(form_type, filename, content)

    FormSubmissionMailer.email_form(form, content, form.user).deliver_now
  end


  private

  def generate_pdf(form)
    # Create ActionView instance to access PDF generation
    # outside of controller
    
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
    Azure::Storage::Blob::BlobService.create(storage_account_name: ENV["AZURE_STORAGE_ACCOUNT"],
                                             storage_access_key: ENV["AZURE_STORAGE_ACCESS_KEY"])
  end

  def container_exists?(client, form_type)
    container_names = []
    client.list_containers().each { |cont| container_names.push(cont.name) }
    container_names.include?(form_type)
  end
end
