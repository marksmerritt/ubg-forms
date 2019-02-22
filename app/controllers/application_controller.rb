class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  protected

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def user_not_authorized
    flash[:alert] = "You have not been authorized to perform this action."
    redirect_to(request.referrer || dashboard_index_path)
  end
end
