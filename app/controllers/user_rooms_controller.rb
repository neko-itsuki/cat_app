class UserRoomsController < ApplicationController
    
  before_action :authenticate_user!
  # before_action :set_room_or_move, only: :show

  def index
    @user_rooms = UserRoom.where(user_id: current_user.id)
  end

  def show
    @user_room = UserRoom.find(params[:id])
    @user_message = UserMessage.new
    @user_messages = UserMessage.where(user_room_id: @user_room.id)
  end
  
  def create
    @user_room = UserRoom.new(user_room_params)
    @user_room.user_id = current_user.id
    @cat = Cat.find_by(id: @user_room.cat_id) 
    if @user_room.save
      flash[:success] = "#{@cat.cat_name}のチャットルームを作成しました"
      redirect_to action: :show
    else
      redirect_to root_url 
    end
  end

  private
    
    def user_room_params
      params.permit(:center_id, :cat_id)
    end
  
end