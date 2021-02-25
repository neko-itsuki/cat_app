class CentersController < ApplicationController
  
  def index
    @centers = Center.page(params[:page]).per(10)
  end
  
  def show
    @center = Center.find(params[:id])
    @cats = Cat.page(params[:page]).per(5)
  end
  
end
