class Portal::BaseController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  layout 'portal'
end