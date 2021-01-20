class CatsController < ApplicationController
  
  before_action :center_signed_in?, only: [:create, :destroy, :edit, :update]
  before_action :correct_center, only: :destroy
  
  def index
    @cats = Cat.page(params[:page]).per(5)
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def new
    if !center_signed_in?
      redirect_to root_path
    end
    @cat = Cat.new
  end
  
  def create
    @cat = current_center.cats.build(cat_params)
    # @cat.image.attach(params[:cat][:image])
    if @cat.save
      flash[:success] = "#{@cat.name}の投稿を作成しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @cat.update(cat_params)
      flash[:success] = "#{@cat.name}のプロフィールを更新しました"
      redirect_to @cat
    else
      render 'edit'
    end
  end
  
  def destroy
    @cat.destroy
    flash[:success] = "#{@cat.name}の投稿を削除しました"
    # redirect_to request.referrer || root_url
    redirect_back(fallback_location: root_url)
  end
  
  private
    
    def cat_params
      params.require(:cat).permit(:name, :type, :gender, :age, :weight,
                        :coat_color, :contraceptive_castrated, :microchip,
                        :vaccination, :one_thing, :health, :personality,
                        :history_of_protection, :remarks, :center_information)
    end
    
    def correct_center
      @cat = current_center.cats.find_by(id: params[:id])
      redirect_to root_url if @cat.nil?
    end
  
end
