class UserMessagesController < ApplicationController
  
  def create
    user_message = UserMessage.new(user_message_params)
    if user_message.save
      redirect_to user_room_path(id: user_message.user_room_id)
    else
      redirect_to user_room_path(id: user_message.user_room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  
    def user_message_params
      params.require(:user_message).permit(:user_message, :user_room_id).merge(user_id: current_user.id)
    end
  
end