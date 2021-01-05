class UsersController < ApplicationController
  
  # before_action :logged_in_user, only: [:index]
  
  def index
    @users = User.page(params[:page]).per(1)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
