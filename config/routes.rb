Rails.application.routes.draw do
  # get 'user/index'
  devise_for :users
  # get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"

  # get 'user_path(:id)' => '/users'

  # get 'signup' => 'users#new', as: 'signup'
  # get 'login' => 'devise/sessions#new', as: 'login'
  get 'logout' => 'devise/sessions#destroy'

  resources :user, only: [:index,:show]
  resources :events
  
end
