WalkMeHome::Application.routes.draw do
  
  root to: 'texts#new'

  resources :texts
end
