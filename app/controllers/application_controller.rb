# encoding: utf-8

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :before_filter_actions

end
