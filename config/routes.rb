Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :activities 
  resources :categories
  resources :emotions
  resources :feelings

  mount API::Base, at: "/"

  devise_scope :user do
    get '/users/sign_out',  :to => 'devise/sessions#destroy'
    # get '/users/sign_up', to: 'registrations#new'
    # post '/users', to: 'registrations#create', as: :registration
  end
  
  #get 'home/index'

  # resources :users
  
  get 'home/about'
  get 'archives/index'

  get 'home/chart_period/:num_of_days', to: 'home#chart_period', as: 'chart_period'
  # get '/chart_seven_days' to: 'home#chart_seven_days'
  # post 'home/chart_thirty_days'
  # post 'home/chart_year'
  #root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
