Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bachelorettes, only: [:show]
  resources :contestants, only: [:index, :show]

  get "bachelorettes/:bachelorette_id/contestants", to: "contestants#index"
end
