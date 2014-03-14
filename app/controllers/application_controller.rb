# encoding: utf-8

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :before_filter_actions, :except => [:impressum, :privacy_policy]

  def impressun

  end

  def documentation
    check_user_signed_in
  end

  def privacy_policy

  end

end
