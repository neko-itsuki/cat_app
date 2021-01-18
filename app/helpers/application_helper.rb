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
    elsif foster_parent_recruiter_signed_in?
      foster_parent_recruiter_registration_path
    elsif center_signed_in?
      center_registration_path
    else
      false
    end
  end
  
  def current_delete_session
    if user_signed_in?
      destroy_foster_parent_recruiter_session_path
    elsif foster_parent_recruiter_signed_in?
      destroy_foster_parent_recruiter_session_path
    elsif center_signed_in?
      destroy_center_session_path
    else
      false
    end
  end
  
end
