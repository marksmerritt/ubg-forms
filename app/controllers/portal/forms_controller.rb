require "azure_helper"

class Portal::FormsController < Portal::BaseController
  impressionist :actions=>[:new,:create]
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
      FormToAzureWorker.perform_async(@form.id)
      CalcFormTimeWorker.perform_async(current_user.id)
      redirect_to form_overview_path, notice: "Your Form was submitted successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_azure_deletion_variables(@form)

    if @form.update(form_params)
      DeleteFormFromAzureWorker.perform_async(@azure_filename, @form_image_count)
      FormToAzureWorker.perform_async(@form.id) 
      redirect_to form_overview_path, notice: "Your Form was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    set_azure_deletion_variables(@form)

    if @form.destroy
      DeleteFormFromAzureWorker.perform_async(@azure_filename, @form_image_count)
      redirect_to form_overview_path, notice: "Your form was successfully deleted"
    else
      redirect_to form_overview_path, notice: "Unable to delete your form. Please try again"
    end
  end



  private

  def form_params
    valid_params = @form_type.valid_fields
    params.require(:form).permit(:job_number, :comment,
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

  def set_azure_deletion_variables(form)
    @azure_dir = AzureHelper.generate_dir(@form)
    @azure_filename = AzureHelper.generate_filename(form: @form, dir: @azure_dir, content_type: "form")
    @form_image_count = @form.images.count 
  end
end
