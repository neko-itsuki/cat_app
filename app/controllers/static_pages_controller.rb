class StaticPagesController < ApplicationController
  
  def home
    @animals = Cat.all + Dog.all
    @animals.shuffle!
  end
  
  def about
  end
  
  def flow
    
  end
  
end
