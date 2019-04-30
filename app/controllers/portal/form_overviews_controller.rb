class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_categories = FormCategory.all
    @form_types = FormType.active.order(:name)
    @forms = Form.includes(:user, :form_type).with_attached_images.order("created_at DESC").limit(50)
    @form_uploads = FormUpload.includes(:user, :form_type).order("created_at DESC")

    respond_to do |format|
      format.html do |html|
        html.mobile 
      end
    end
  end
end