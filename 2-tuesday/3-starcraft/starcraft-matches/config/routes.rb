Rails.application.routes.draw do

  resources :players, only: [] do
    resources :matches, only: [:index]
  end

  resources :factions, only: [] do
    resources :matches, only: [:index]
  end

end
