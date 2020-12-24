Rails.application.routes.draw do
    
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/description', to: 'static_pages#description'
  get '/flow', to: 'static_pages#flow'
  get '/action', to: 'static_pages#action'
  get '/hospital', to: 'static_pages#hospital'
  root 'static_pages#home'
  
end
