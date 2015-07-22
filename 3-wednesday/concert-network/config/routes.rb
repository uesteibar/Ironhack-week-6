Rails.application.routes.draw do

  get "/" => "sites#home"

  get "/concerts/budget/search" => "concerts#search"
  get "/concerts/budget" => "concerts#budget"
  get "/concerts/most-commented" => "concerts#most_commented"
  resources :concerts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end

  resources :cities, only: [:index, :create, :destroy]

end
