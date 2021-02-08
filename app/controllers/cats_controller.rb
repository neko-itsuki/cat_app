class CatsController < ApplicationController
  
  before_action :authenticate_center!, only: [:new, :create, :edit, :update, :destroy]
  before_action :logged_in_center, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_center, only: [:edit, :update, :destroy]
  
  def index
    @cats = Cat.page(params[:page]).per(5)
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = current_center.cats.build(cat_params)
    # @cat.image.attach(params[:cat][:image])
    if @cat.save
      flash[:success] = "#{@cat.cat_name}の投稿を作成しました"
      redirect_to @cat
    else
      render 'new'
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:success] = "#{@cat.cat_name}のプロフィールを更新しました"
      redirect_to @cat
    else
      render 'edit'
    end
  end
  
  def destroy
    @cat.destroy
    flash[:success] = "#{@cat.cat_name}の投稿を削除しました"
    # redirect_to request.referrer || root_url
    redirect_back(fallback_location: root_url)
  end
  
  private
    
    def cat_params
      params.require(:cat).permit(:cat_name, :cat_type, :cat_gender, :cat_age, :cat_weight,
                        :cat_coat_color, :cat_image, :cat_contraceptive_castrated, :cat_microchip,
                        :cat_vaccination, :cat_one_thing, :cat_health, :cat_personality,
                        :cat_history_of_protection, :cat_remarks, :cat_center_information)
    end
    
    def logged_in_center
      render template: "devise/centers/sessions/new" if !center_signed_in?
    end
    
    def correct_center
      @cat = current_center.cats.find_by(id: params[:id])
      redirect_to center_path(current_center) if @cat.nil?
    end
    
end
