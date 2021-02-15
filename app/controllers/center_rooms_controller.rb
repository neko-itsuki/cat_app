class CenterRoomsController < ApplicationController
  
  before_action :authenticate_center!

  def index
    @center_rooms = UserRoom.where(center_id: current_center.id)
  end

  def show
    @center_room = UserRoom.find(params[:id])
    @center_message = UserMessage.new
    @center_messages = UserMessage.where(user_room_id: @center_room.id)
  end
  
end