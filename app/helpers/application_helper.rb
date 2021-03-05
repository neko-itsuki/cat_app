module ApplicationHelper
  
  def full_title(page_title = '')
    base_title = "保護犬、保護猫の譲渡里親マッチングサイト"
    if page_title.empty? || page_title == 'Home'
      base_title
    else
      page_title + "|" + base_title
    end
  end
  
  def current_destroy
    if user_signed_in?
      user_registration_path
    elsif center_signed_in?
      center_registration_path
    else
      false
    end
  end
  
  def current_delete_session
    if user_signed_in?
      destroy_user_session_path
    elsif center_signed_in?
      destroy_center_session_path
    else
      false
    end
  end
  
  def current_profile_path
    if user_signed_in?
      user_path(current_user)
    elsif center_signed_in?
      center_path(current_center)
    else
      false
    end
  end
  
  def animal_request
    if current_page?(new_cat_path) || current_page?(new_dog_path)
      "新規投稿"
    else
      "プロフィール更新"
    end
  end
  
  def current_rooms_path
    if user_signed_in?
      user_rooms_path(current_user)
    elsif center_signed_in?
      center_rooms_path(current_center)
    else
      false
    end
  end
  
  def unchecked_notifications
    if user_signed_in?
      @notifications = current_user.user_passive_notifications.where(checked: false)
    elsif center_signed_in?
      @notifications = current_center.center_passive_notifications.where(checked: false)
    end
  end
  
end
