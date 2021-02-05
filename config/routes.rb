Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :activities 
  resources :categories
  resources :emotions
  resources :feelings

  
  devise_scope :user do
    get '/users/sign_out',  :to => 'devise/sessions#destroy'
    # get '/users/sign_up', to: 'registrations#new'
    # post '/users', to: 'registrations#create', as: :registration
  end
  
  #get 'home/index'

  # resources :users
  
  get 'home/about'
  get 'archives/index'
  
  #root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
