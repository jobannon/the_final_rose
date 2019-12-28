Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contestants/:contestant_id", to: "contestants#show"
  get "/bachelorettes/:bachelorette_id/contestants", to: "contestants#index"
  get "/bachelorettes/:id", to: "bachelorettes#show" 
  resources :bachelorettes, only: [:show]
  get "/bachelorettes/:bachelorette_id/contestants", to: "contestants#index"
  resources :outings, only: [:show]

end
