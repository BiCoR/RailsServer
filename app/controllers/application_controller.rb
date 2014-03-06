# encoding: utf-8

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :before_filter_actions, :except => [:impressum, :disclaimer]

  def impressun

  end

  def disclaimer

  end

  def privacy_policy

  end
end
