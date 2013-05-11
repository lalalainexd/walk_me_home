WalkMeHome::Application.routes.draw do
  
  root to: 'texts#new'

  post '/input' => 'texts#input'

  resources :texts
end
