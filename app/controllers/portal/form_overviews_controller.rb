class Portal::FormOverviewsController < Portal::BaseController
  def show
    @form_categories = FormCategory.all
    @form_types = FormType.active.order(:name)
    set_forms
    @form_uploads = FormUpload.includes(:user, :form_type).order("updated_at DESC")

    respond_to do |format|
      format.html do |html|
        html.mobile 
      end
    end
  end


  private 

  def set_forms
    if current_user.company.top?
      @forms = Form.includes(:user, :form_type).order("updated_at DESC")
    else
      @forms = current_user.company.forms.includes(:user, :form_type).order("updated_at DESC")
    end 
    
  end
end