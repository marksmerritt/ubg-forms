class Portal::FormTypesController < Portal::BaseController
  before_action :set_form_type, :authorize_form_type, only: [:edit, :update, :destroy]
  
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
      redirect_to form_types_path, notice: "#{@form_type.name} Form created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @form_type.update(form_type_params)
      redirect_to form_types_path, notice: "#{@form_type.name} Form updated successfully!"
    else
      render :edit, notice: "Unable to update form type. Please try again."
    end
  end

  def destroy
    if @form_type.destroy
      redirect_to form_types_path, notice: "The form type has been deleted."
    else
      redirect_to (request.referrer || form_types_path), notice: "Unable to delete form type. Please try again"
    end
  end
  


  private

  def form_type_params
    valid_field_params = FormField.attribute_names.map(&:to_sym).push(:_destroy)
    params.require(:form_type).permit(:name, 
                                      header_fields_attributes: valid_field_params,
                                      footer_fields_attributes: valid_field_params)
  end

  def set_form_type
    @form_type = FormType.find(params[:id])
  end

  def authorize_form_type
    authorize @form_type
  end
end
