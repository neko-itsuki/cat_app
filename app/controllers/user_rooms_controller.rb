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
      @user_room = UserRoom.find_by(params[:user_id], params[:center_id], params[:cat_id], params[:dog_id])
      if !@user_room.nil?
        render action: :show
      end
    end
    
    # def user_room_already
      # @user_room = UserRoom.where(params[:user_id])
      # if @user_room.cat_id == params[:cat_id] || @user_room.cat_id == params[:dog_id]
      #   render action: :show
      # end
    # end
    
end