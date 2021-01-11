class FosterParentRecruitersController < ApplicationController
  
  def show
    @foster_parent_recruiter = FosterParentRecruiter.find(params[:id])
  end
  
end
