class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :set_current_user_id

end
