class Portal::ChecklistTypesController < Portal::BaseController
  def index
  end

  def new
    @checklist_type = ChecklistType.new
  end

  def create
    @checklist_type = ChecklistType.new(checklist_type_params)

    if @checklist_type.save
      redirect_to checklist_types_path, notice: "Checklist Type created successfully"
    else
      render :new
    end
  end

  private

  def checklist_type_params
    params.require(:checklist_type).permit(:name, :rows, :cols)
  end
end
