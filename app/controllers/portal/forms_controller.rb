class Portal::FormsController < Portal::BaseController
  before_action :set_form, :authorize_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.all
    authorize @forms
  end

  def show
  end

  def new
    @form = Form.new(form_type_id: params[:form_type_id])
    authorize @form
  end

  def create
    @form = Form.new(form_params)
    authorize @form

    @form.user = current_user

    if @form.save
      redirect_to form_path(@form), notice: "Your Form was submitted successfully"
    else
      redirect_to forms_path, notice: "Unable to create form. Please try again."
    end
  end

  def edit
  end

  def update
    if @form.update(form_params)
      redirect_to @form, notice: "Your #{@form.form_type.name} was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @form.destroy
      redirect_to forms_path, notice: "Your form was successfully deleted"
    else
      redirect_to @form, notice: "Unable to delete form. Please try again"
    end
  end


  private

  def form_params
    params.require(:form).permit!
  end

  def set_form
    @form = Form.find(params[:id])
  end

  def authorize_form
    authorize @form
  end
end
