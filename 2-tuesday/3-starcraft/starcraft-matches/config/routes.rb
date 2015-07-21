Rails.application.routes.draw do

  resources :players, only: [:index, :show] do
    resources :matches, only: [:index]
  end

  resources :factions, only: [] do
    resources :matches, only: [:index]
  end

end
