class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :portal_controller?

  protected

  def after_sign_in_path_for(resource)
    portal_index_path
  end

  def portal_controller?
    controller_name == "portal"
  end

end
