class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.all
    @forms = Form.includes(:user, :form_type).order("updated_at DESC").limit(25)

    respond_to do |format|
      format.html do |html|
        html.mobile 
      end
    end
  end
end