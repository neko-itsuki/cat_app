class CenterRoomsController < ApplicationController
  
  before_action :authenticate_center!

  def index
    @center_rooms = UserRoom.where(center_id: current_center.id).preload(:cat, :dog, :center)
  end

  def show
    @center_room = UserRoom.find(params[:id])
    @center_message = UserMessage.new
    @center_messages = UserMessage.where(user_room_id: @center_room.id)
    @notifications = current_center.center_passive_notifications.where(is_user: true, checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
end