module ApplicationHelper

  def set_current_user_id
    if current_user
      User.current_user_id = current_user.id
    else
      User.current_user_id = 0
    end
  end

  def check_admin_only
    redirect_to user_people_path(current_user.id) unless current_user.isAdmin?
  end

  def check_admin_or_own
    redirect_to user_people_path(current_user.id) unless current_user.isAdmin? || current_user.id == params[:id]
  end

end
