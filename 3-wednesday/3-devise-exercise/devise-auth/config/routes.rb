Rails.application.routes.draw do
  devise_for :users,  path: "",
                      path_names: {sign_in: "login", sign_up: "signup"}

  root to: "home#index"

end
