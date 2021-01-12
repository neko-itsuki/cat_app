class CentersController < ApplicationController
  
  def index
    @centers = Center.page(params[:page]).per(5)
  end
  
  def show
    @center = Center.find(params[:id])
  end
  
end
