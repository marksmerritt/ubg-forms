class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :home_controller?

  layout :layout_by_controller

  protected

  def after_sign_in_path_for(resource)
    portal_index_path
  end

  def home_controller?
    controller_name == "home" || controller_name == "legal"
  end

  def layout_by_controller
    "portal" unless home_controller?
  end
end
