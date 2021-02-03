Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users
  resources :activities 
  resources :categories
  resources :emotions
  resources :feelings

  devise_scope :user do
    get '/users/sign_out',  :to => 'devise/sessions#destroy'
  end
  
  #get 'home/index'
  
  get 'home/about'
  get 'archives/index'
  
  #root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
