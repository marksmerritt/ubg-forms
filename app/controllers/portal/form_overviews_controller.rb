class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.all
    @forms = Form.includes(:user, :form_type).order("updated_at DESC").limit(25)
  end
end