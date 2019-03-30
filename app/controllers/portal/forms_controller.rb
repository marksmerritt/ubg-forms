class Portal::FormsController < Portal::BaseController
  before_action :set_form_type
  before_action :set_form, :authorize_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.all
    authorize @forms
  end

  def show
    respond_to do |format|
      format.html 
      format.pdf do 
        render pdf: "form_#{@form.id}",
        template: "portal/forms/pdf.html.erb"
      end
    end
  end

  def new
    @form = Form.new
    authorize @form
  end

  def create
    @form = Form.new(form_params)
    authorize @form

    @form.form_type = @form_type
    @form.user = current_user

    if @form.save
      FormToAzureJob.perform_later(@form.id) unless Rails.env.test?
      redirect_to form_overview_path, notice: "Your Form was submitted successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @form.update(form_params)
      DeleteFormFromAzureJob.perform_later(@form.id) unless Rails.env.test?
      FormToAzureJob.perform_later(@form.id) unless Rails.env.test?
      redirect_to [@form_type, @form], notice: "Your Form was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @form = Form.find(params[:id])
    DeleteFormFromAzureJob.perform_later(@form.id) unless Rails.env.test?
    redirect_to form_overview_path, notice: "Your form was successfully deleted"
  end



  private

  def form_params
    valid_params = @form_type.valid_fields
    params.require(:form).permit(:job_number,
                                 header_properties: valid_params,
                                 checklist_properties: valid_params,
                                 footer_properties: valid_params,
                                 images: [])
  end

  def set_form_type
    @form_type = FormType.find(params[:form_type_id])
  end

  def set_form
    @form = Form.find(params[:id])
  end

  def authorize_form
    authorize @form
  end
end
