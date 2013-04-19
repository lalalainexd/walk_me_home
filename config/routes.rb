WalkMeHome::Application.routes.draw do
  
  root to: 'texts#index'
  resources :users
  resources :emergency_contacts

end
