Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  # get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :user
  resources :events
  
end
