class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_types = FormType.all
    @forms = current_user.forms.all
  end
end