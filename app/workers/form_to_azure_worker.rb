class FormToAzureWorker
  include Sidekiq::Worker 

  def perform(form_id)
    form = Form.find(form_id)
    send_form(form)
  end

  def send_form(form)
    client = create_azure_instance
    container = ENV["AZURE_CONTAINER_NAME"]

    filename = generate_filename(form)
    content = generate_pdf(form)

    client.create_block_blob(container, filename, content)

    if form.has_failures
      FormSubmissionMailer.email_form(form, content, form.user).deliver_now
    end
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

  def generate_filename(form)
    form_type = "#{form.form_type.name.gsub(' ', '-').downcase!}s"
    
    "#{form_type}/job##{form.job_number}--#{form.created_at.strftime('%Y-%m-%d')}--#{form.id}"
  end
end