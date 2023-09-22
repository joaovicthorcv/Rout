Rails.application.routes.draw do
  
  root 'home#index'
  # devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :activities 
  resources :categories
  resources :emotions
  resources :feelings

  # mount API::Base, at: "/"

  # devise_for :users
  # namespace 'api', defaults: { format: :json } do
  # 	namespace 'v1' do
  #     # get '/users/sign_out',  :to => 'devise/sessions#destroy'
  #     devise_scope :user do
  #       post 'sign_up', to: 'registrations#create'
  #       post 'sign_in', to: 'sessions#create'    
  #     end
  #     resources :activities
  # 	end
  # end

  # scope :api, defaults: { format: :json } do
  #   devise_for :users, controllers: { sessions: 'users/sessions', 
  #                                     registrations: 'users/registrations' }
  #   resource :user, only: [:show, :update]
  # end

  devise_for :users
  namespace 'admin' do
    devise_scope :user do
      get '/users/sign_out',  :to => 'devise/sessions#destroy'
      get '/users/sign_up', to: 'users/registrations#new'
      post '/users', to: 'users/registrations#create', as: :registration
    end
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
