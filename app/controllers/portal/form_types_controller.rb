class Portal::FormTypesController < Portal::BaseController
  before_action :set_form_type, only: [:show, :destroy]
  
  def index
    @form_types = FormType.all
    authorize @form_types
  end

  def show
    authorize @form_type
  end

  def new
    @form_type = FormType.new
    authorize @form_type
  end

  def create
    @form_type = FormType.new(form_type_params)
    authorize @form_type

    if @form_type.save
      redirect_to @form_type, notice: "#{@form_type.name} Form created successfully!"
    else
      render :new
    end
  end

  def destroy
    authorize @form_type

    if @form_type.destroy
      redirect_to form_types_path, notice: "The form type has been deleted."
    else
      redirect_to (request.referrer || form_types_path), notice: "Unable to delete form type. Please try again"
    end
  end
  


  private

  def form_type_params
    params.require(:form_type).permit(:name)
  end

  def set_form_type
    @form_type = FormType.find(params[:id])
  end
end
