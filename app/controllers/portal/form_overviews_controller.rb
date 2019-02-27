class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.all
    @forms = current_user.forms.order("updated_at DESC").limit(3)
  end
end