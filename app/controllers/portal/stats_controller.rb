class Portal::StatsController < Portal::BaseController
  def index
    @form_count = Form.count
  end


  # Render JSON to pass to chartkick for up-to-date statistics

  def new_users
    render json: User.group_by_day(:created_at).count
  end

  def new_forms
    render json: Form.group_by_day(:created_at).count
  end

  def new_form_time
    render json: FormTimeTracker.pluck(:created_at, :time_taken)
    @avg_time_taken = FormTimeTracker.average(:time_taken)
  end
end
