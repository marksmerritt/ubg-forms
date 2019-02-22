class Portal::FormTypesController < Portal::BaseController
  def index
    @form_types = FormType.all
    authorize @form_types
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

  def show
    @form_type = FormType.find(params[:id])
    authorize @form_type
  end


  private

  def form_type_params
    params.require(:form_type).permit(:name)
  end
end
