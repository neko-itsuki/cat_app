class CenterMessagesController < ApplicationController
  
  def create
    center_message = UserMessage.new(center_message_params)
    if center_message.save
      save_message_notice!(center_message.id, center_message.user_room.user.id)
      redirect_to center_room_path(id: center_message.user_room_id)
    else
      flash[:warning] = 'メッセージを入力してください'
      redirect_to center_room_path(id: center_message.user_room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  
    def center_message_params
      params.require(:user_message).permit(:user_message, :user_room_id).merge(center_id: current_center.id)
    end
    
    def save_message_notice!(message_id, user_id)
      message_notice = current_center.center_active_notifications.new(
        visitor_id: current_center.id,
        visited_id: user_id,
        message_id: message_id,
        is_user: false
      )
      message_notice.save if message_notice.valid?
    end
  
end