class DogsController < ApplicationController
  
  before_action :center_signed_in?, only: [:create, :destroy, :edit, :update]
  before_action :correct_center, only: :destroy
  
  def index
    @dogs = Dog.page(params[:page]).per(5)
  end
  
  def show
    @dog = Dog.find(params[:id])
  end
  
  def new
    if !center_signed_in?
      redirect_to root_path
    end
    @dog = Dog.new
  end
  
  def create
    @dog = current_center.dogs.build(dog_params)
    # @dog.image.attach(params[:dog][:image])
    if @dog.save
      flash[:success] = "#{@dog.dog_name}の投稿を作成しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @dog = Dog.find(params[:id])
  end
  
  def update
    if @dog.update(dog_params)
      flash[:success] = "#{@dog.dog_name}のプロフィールを更新しました"
      redirect_to @dog
    else
      render 'edit'
    end
  end
  
  def destroy
    @dog.destroy
    flash[:success] = "#{@dog.dog_name}の投稿を削除しました"
    # redirect_to request.referrer || root_url
    redirect_back(fallback_location: root_url)
  end
  
  private
    
    def dog_params
      params.require(:dog).permit(:dog_name, :dog_type, :dog_gender, :dog_age, :dog_weight,
                        :dog_coat_color, :dog_contraceptive_castrated, :dog_microchip,
                        :dog_vaccination, :dog_one_thing, :dog_health, :dog_personality,
                        :dog_history_of_protection, :dog_remarks, :dog_center_information)
    end
    
    def correct_center
      @dog = current_center.cats.find_by(id: params[:id])
      redirect_to root_url if @dog.nil?
    end
  
end
