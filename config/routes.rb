Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  get "/square_maps/:id", to: "square_maps#show"
  post "/square_maps", to: "square_maps#create"
  patch "/square_maps/:id", to: "square_maps#update"

  get "/square_tiles", to: "square_tiles#all"

  # Defines the root path route ("/")
  # root "posts#index"
end
