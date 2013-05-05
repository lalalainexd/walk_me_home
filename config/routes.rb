WalkMeHome::Application.routes.draw do
  get "sessions/new"

  root to: 'texts#index'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  resources :users
  resources :emergency_contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :texts
  resources :trips, only: [:create, :show]
end
