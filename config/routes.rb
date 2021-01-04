Rails.application.routes.draw do
  
  
  
  devise_for :users
    
    resources :activities do
      get :extend
    end
    resources :categories
    resources :emotions
    #get 'home/index'
    root 'home#index'
    get 'home/about'
    get 'archives/index'
    
    #root 'home#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
