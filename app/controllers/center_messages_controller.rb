class CenterMessagesController < ApplicationController
  
  def create
    center_message = UserMessage.new(center_message_params)
    if center_message.save
      redirect_to center_room_path(id: center_message.user_room_id)
    else
      redirect_to center_room_path(id: center_message.user_room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def center_message_params
    params.require(:user_message).permit(:user_message, :user_room_id).merge(center_id: current_center.id)
  end
  
end