require 'resque/server'

WalkMeHome::Application.routes.draw do
  mount Resque::Server.new, at: "/resque"

  get "sessions/new"

  post '/input' => 'texts#input'

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
