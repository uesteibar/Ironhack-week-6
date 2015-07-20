Rails.application.routes.draw do
  get '/' => 'tournaments#index'

  get '/api/tournaments' => 'tournaments#api_index'
end
