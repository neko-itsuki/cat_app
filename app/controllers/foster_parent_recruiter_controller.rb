class FosterParentRecruiterController < ApplicationController
  
  def show
    @foster_parent_recruiters = FosterParentRecruiter.find(params[:id])
  end
  
end
