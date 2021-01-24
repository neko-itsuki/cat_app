Rails.application.routes.draw do
  
  devise_for :centers, controllers: {
      sessions:       'devise/centers/sessions',
      passwords:      'devise/centers/passwords',
      registrations:  'devise/centers/registrations'
  }
  
  devise_for :foster_parent_recruiters, controllers: {
      sessions:       'devise/foster_parent_recruiters/sessions',
      passwords:      'devise/foster_parent_recruiters/passwords',
      registrations:  'devise/foster_parent_recruiters/registrations'
  }
  
  devise_for :users, controllers: {
    sessions:       'devise/users/sessions',
    passwords:      'devise/users/passwords',
    registrations:  'devise/users/registrations'
  }
  
  resources :centers, only: [:index,:show]
  resources :foster_parent_recruiters, only: [:show]
  resources :users, only: [:show]
  resources :cats
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
