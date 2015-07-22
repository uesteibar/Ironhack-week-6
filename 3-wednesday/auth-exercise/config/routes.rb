Rails.application.routes.draw do
  # This route sends requests to our naked
  # url to the home action in the users controller
  root to: 'users#home'

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/profile' => 'users#show'
  get '/users' => 'users#index'

end
