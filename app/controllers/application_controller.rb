# encoding: utf-8

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :before_filter_actions, :except => [:impressum, :privacy_policy, :documentation]

  def impressun

  end

  def documentation

  end

  def privacy_policy

  end

end
