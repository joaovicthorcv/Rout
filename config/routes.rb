Rails.application.routes.draw do
  
  get 'archives/index'
  devise_for :users
    resources :activities
    resources :categories
    #get 'home/index'
    root 'activities#index'
    get 'home/about'
    
    #root 'home#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
