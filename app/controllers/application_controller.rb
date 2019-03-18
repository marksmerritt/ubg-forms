class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout :layout_by_resource

  protected

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def after_sign_up_path_for(resource)
    dashboard_index_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end

  def user_not_authorized
    flash[:alert] = "You have not been authorized to perform this action."
    redirect_to(request.referrer || dashboard_index_path)
  end

  def layout_by_resource
    if devise_controller?
      "portal"
    else
      "application"
    end
  end
end
