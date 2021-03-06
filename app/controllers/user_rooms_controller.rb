class UserRoomsController < ApplicationController
    
  before_action :authenticate_user!
  before_action :user_room_already, only: :create

  def index
    @user_rooms = UserRoom.where(user_id: current_user.id)
  end

  def show
    @user_room = UserRoom.find(params[:id])
    @user_message = UserMessage.new
    @user_messages = UserMessage.where(user_room_id: @user_room.id)
    @notifications = current_user.user_passive_notifications.where(is_user: false, checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
  def create
    @user_room = UserRoom.new(user_room_params)
    @user_room.user_id = current_user.id
    if @user_room.save
      flash[:success] = "#チャットルームを作成しました"
      redirect_to user_room_path(@user_room)
    else
      flash[:danger] = "チャットルームを作成できませんでした"
      redirect_to root_url 
    end
  end

  private
    
    def user_room_params
      params.permit(:center_id, :cat_id, :dog_id)
    end
    
    def user_room_already
      @user_room = UserRoom.find_by(user_room_params)
      if !@user_room.nil?
        redirect_to user_room_path(@user_room)
      end
    end
    
end