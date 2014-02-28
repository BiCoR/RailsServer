# encoding: utf-8

module ApplicationHelper

  def before_filter_actions
    set_current_user_id
    set_locale
  end

  def set_current_user_id
    if current_user
      User.current_user_id = current_user.id
    else
      User.current_user_id = 0
    end
  end

  def check_admin_only
    flash.keep(:notice)
    redirect_to user_people_path(current_user.id) unless current_user.isAdmin?
  end

  def check_admin_or_own
    flash.keep(:notice)
    redirect_to user_people_path(current_user.id) unless current_user.isAdmin? || current_user.id == params[:id]
  end

  private
  def set_locale
    http_accept_language.user_preferred_languages # => %w(nl-NL nl-BE nl en-US en)
    available = %w(en de)
    http_accept_language.preferred_language_from(available) # => 'nl-BE'

    I18n.locale = http_accept_language.compatible_language_from(available)
  end

end
