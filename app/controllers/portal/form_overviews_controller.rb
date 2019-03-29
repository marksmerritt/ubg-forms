class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.order(:name)
    @forms = Form.includes(:user, :form_type).order("updated_at DESC").limit(30)

    respond_to do |format|
      format.html do |html|
        html.mobile 
      end
    end
  end
end