class Portal::FormTypesController < Portal::BaseController
  def new
    @form_type = FormType.new
    authorize @form_type
  end

  def create
    @form_type = FormType.new(form_type_params)

    if @form_type.save
      redirect_to @form_type, notice: "#{@form_type.name} Form created successfully!"
    else
      render :new
    end
  end

  def show
  end


  private

  def form_type_params
    params.require(:form_type).permit(:name)
  end
end
