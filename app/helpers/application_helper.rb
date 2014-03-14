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
    unless current_user.isAdmin?
      flash.keep if flash[:notice]
      redirect_to user_people_path(current_user.id)
    end
  end

  def check_admin_or_own
    unless current_user.isAdmin? || current_user.id.to_s == params[:id]
      flash.keep if flash[:notice]
      redirect_to user_people_path(current_user.id)
    end
  end

  def check_user_signed_in
    unless current_user
      flash[:error] = t('devise.failure.unauthenticated')
      flash.keep if flash[:notice]
      #:authenticate_user!
      redirect_to :new_user_session unless current_user
    end
  end

  private
  def set_locale
    http_accept_language.user_preferred_languages
    available = %w(en de)
    http_accept_language.preferred_language_from(available)

    I18n.locale = http_accept_language.compatible_language_from(available)
  end

end
