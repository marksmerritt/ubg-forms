class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.active.order(:name)
    @forms = Form.includes(:user, :form_type).order("updated_at DESC").limit(10)
    @form_uploads = FormUpload.includes(:user, :form_type).order("updated_at DESC").limit(10)

    respond_to do |format|
      format.html do |html|
        html.mobile 
      end
    end
  end
end