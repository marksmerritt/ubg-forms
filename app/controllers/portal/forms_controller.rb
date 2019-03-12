class Portal::FormsController < Portal::BaseController
  include PdfToAzure
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
      send_pdf_to_azure(@form)
      redirect_to [@form_type, @form], notice: "Your Form was submitted successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @form.update(form_params)
      redirect_to [@form_type, @form], notice: "Your Form was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @form.destroy
      redirect_to form_overview_path, notice: "Your form was successfully deleted"
    else
      redirect_to [@form_type, @form], notice: "Unable to delete form. Please try again"
    end
  end


  private

  def form_params
    valid_params = @form_type.valid_fields
    params.require(:form).permit(header_properties: valid_params,
                                 checklist_properties: valid_params,
                                 footer_properties: valid_params)
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
