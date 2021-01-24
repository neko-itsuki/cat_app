class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: :show
  before_action :logged_in_user, only: :show
  before_action :correct_user, only: :show
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
    def logged_in_user
      render template: "devise/users/sessions/new" if !user_signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) if current_user != @user
    end
    
end
