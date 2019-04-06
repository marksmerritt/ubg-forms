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
      redirect_to form_overview_path, notice: "Your form was successfully uploaded"
    else
      render :new, notice: "There was an error uploading your form. Please try again."
    end
  end


  private

  def form_upload_params
    params.require(:form_upload).permit(:form)
  end

  def set_form_type
    @form_type = FormType.find(params[:form_type_id])
  end
end
