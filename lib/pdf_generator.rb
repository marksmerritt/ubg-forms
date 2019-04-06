module PdfGenerator
  def self.generate(form)
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
end