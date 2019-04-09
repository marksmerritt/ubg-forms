class Portal::FormUploadsController < Portal::BaseController
  before_action :set_form_type

  def new
    @form_upload = FormUpload.new
  end

  def create
    @form_upload = FormUpload.new(form_upload_params)
    
    @form_upload.form_type = @form_type
    @form_upload.user = current_user

    if @form_upload.save
      FormUploadToAzureWorker.perform_async(@form_upload.id)
      redirect_to form_overview_path, notice: "Your form was successfully uploaded"
    else
      render :new, notice: "There was an error uploading your form. Please try again."
    end
  end

  def destroy
    @form_upload = FormUpload.find(params[:id])
    set_azure_deletion_variables(@form_upload)

    if @form_upload.destroy
      DeleteUploadedFormFromAzureWorker.perform_async(@azure_filename)
      redirect_to form_overview_path, notice: "Your form was successfully deleted"
    else
      redirect_to form_overview_path, notice: "Unable to delete your form. Please try again"
    end
  end


  private

  def form_upload_params
    params.require(:form_upload).permit(:form, :job_number)
  end

  def set_form_type
    @form_type = FormType.find(params[:form_type_id])
  end

  def set_azure_deletion_variables(form_upload)
    @azure_dir = AzureHelper.generate_dir(form_upload)
    @azure_filename = AzureHelper.generate_filename(form: form_upload, dir: @azure_dir, content_type: "form")
  end
end
