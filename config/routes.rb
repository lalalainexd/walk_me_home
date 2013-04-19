WalkMeHome::Application.routes.draw do

  root to: 'texts#index'
  resources :texts
  resources :users
  resources :emergency_contacts
end
