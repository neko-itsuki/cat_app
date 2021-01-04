Rails.application.routes.draw do
  
  # get '/signup', to: 'users#new'
  devise_for :users, controllers: {
      confirmations:  'users/confirmations',
      sessions:       'users/sessions',
      passwords:      'users/passwords',
      registrations:  'users/registrations'
  }
  resources :users, only: [:index,:show]
  # get '/users', to: 'users#index'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/description', to: 'static_pages#description'
  get '/flow', to: 'static_pages#flow'
  get '/action', to: 'static_pages#action'
  get '/hospital', to: 'static_pages#hospital'
  root 'static_pages#home'
  get '/privacy', to: 'static_pages#privacy'
  get '/rule', to: 'static_pages#rule'
  get '/sitemap', to: 'static_pages#sitemap'
  
end
