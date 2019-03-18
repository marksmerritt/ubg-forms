class Portal::BaseController < ApplicationController
  before_action :authenticate_user!

  layout 'portal'
end