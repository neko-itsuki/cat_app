class UserMessagesController < ApplicationController
  
  def create
    user_message = UserMessage.new(user_message_params)
    if user_message.save
      save_message_notice!(user_message.id, user_message.user_room.center.id)
      redirect_to user_room_path(id: user_message.user_room_id)
    else
      flash[:warning] = 'メッセージを入力してください'
      redirect_to user_room_path(id: user_message.user_room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  
    def user_message_params
      params.require(:user_message).permit(:user_message, :user_room_id).merge(user_id: current_user.id)
    end
    
    def save_message_notice!(message_id, center_id)
      message_notice = current_user.user_active_notifications.new(
        visitor_id: current_user.id,
        visited_id: center_id,
        message_id: message_id
      )
      message_notice.save if message_notice.valid?
    end
    
end