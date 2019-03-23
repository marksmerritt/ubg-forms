class Portal::StatsController < Portal::BaseController
  def index
  end


  # Render JSON to pass to chartkick for up-to-date statistics

  def new_users
    render json: User.group_by_day(:created_at).count
  end

  def new_forms
    render json: Form.group_by_day(:updated_at).count
  end
end
