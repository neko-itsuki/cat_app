Rails.application.routes.draw do
  
  devise_for :centers, controllers: {
      sessions:       'devise/centers/sessions',
      passwords:      'devise/centers/passwords',
      registrations:  'devise/centers/registrations'
  }
  
  devise_scope :center do
    post 'centers/guest_center_sign_in', to: 'devise/centers/sessions#new_guest_center'
  end
  
  devise_for :foster_parent_recruiters, controllers: {
      sessions:       'devise/foster_parent_recruiters/sessions',
      passwords:      'devise/foster_parent_recruiters/passwords',
      registrations:  'devise/foster_parent_recruiters/registrations'
  }
  
  devise_scope :foster_parent_recruiters do
    post 'foster_parent_recruiters/guest_foster_parent_recruiter_sign_in', to: 'devise/foster_parent_recruiters/sessions#new_guest_foster'
  end
  
  devise_for :users, controllers: {
    sessions:       'devise/users/sessions',
    passwords:      'devise/users/passwords',
    registrations:  'devise/users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_user_sign_in', to: 'devise/users/sessions#new_guest_user'
  end
  
  resources :centers, only: [:index,:show]
  resources :foster_parent_recruiters, only: [:show]
  resources :users, only: [:show]
  resources :cats
  resources :dogs
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
  
  resources :user_rooms, only: [:index, :show, :create]
  resource :user_message, only: :create
  
  # resources :foster_parent_recruiter_rooms, only: [:index, :show]
  # resource :foster_parent_recruiter_message, only: :create
  
  resources :center_rooms, only: [:index, :show]
  resource :center_message, only: :create
  resources :notifications, only: :index
  
end
