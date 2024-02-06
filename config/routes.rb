Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/", to: "welcome#index"

  get "/pageants", to: "pageants#index"
  get "/pageants/:id", to: "pageants#show"  
  get "/pageants/new", to: "pageants#new"
  post "/pageants",to: "pageants#create"
  get "/pageants/:id/edit", to: "pageants#edit"
  patch "/pageants/:id", to: "pageants#update"
  delete "/pageants/:id", to: "pageants#destroy"

  get "/contestants", to: "contestants#index"
  get "/contestants/:ID", to: "contestants#show"
  get "/contestants/:ID/edit", to: "contestants#edit"
  patch "/contestants/:ID", to: "contestants#update"
  delete "/contestants/:id", to: "contestants#destroy"

  get "/pageants/:id/contestants", to: "pageant/contestants#index"
  get "/pageants/:id/contestants/new", to: "pageant/contestants#new"
  post "/pageants/:id/contestants", to: "pageant/contestants#create"

end