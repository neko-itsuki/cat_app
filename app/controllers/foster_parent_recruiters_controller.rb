class FosterParentRecruitersController < ApplicationController
  
  before_action :authenticate_foster_parent_recruiter!, only: :show
  before_action :logged_in_foster_parent_recruiter, only: :show
  before_action :correct_foster_parent_recruiter, only: :show
  
  def show
    @foster_parent_recruiter = FosterParentRecruiter.find(params[:id])
  end
  
  private
  
    def logged_in_foster_parent_recruiter
      render template: "devise/foster_parent_recruiters/sessions/new" if !foster_parent_recruiter_signed_in?
    end
    
    def correct_foster_parent_recruiter
      @foster_parent_recruiter = FosterParentRecruiter.find(params[:id])
      redirect_to foster_parent_recruiter_path(current_foster_parent_recruiter) if current_foster_parent_recruiter != @foster_parent_recruiter
    end
  
end
