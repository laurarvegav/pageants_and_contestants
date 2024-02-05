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
  get "/contestants", to: "contestants#index"
  get "/contestants/:ID", to: "contestants#show"
  get "/pageants/:id/contest", to: "pageants#contest"
  get "/pageants/new", to: "pageants#new"
  post "/pageants",to: "pageants#create"
  get "/pageants/:id/edit", to: "pageants#edit"
  patch "/pageants/:id", to: "pageants#update"
  get "/pageants/:id/contest_new", to: "pageants#contest_new"
  post "/pageants/:id/contest", to: "pageants#contest_create"
  get "/contestants/:ID/edit", to: "contestants#edit"
  patch "/contestants/:ID", to: "contestants#update"
  delete "/pageants/:id", to: "pageants#destroy"
  delete "/contestants/:id", to: "contestants#destroy"
  # get "/pageants/:id/contest", to: "pageants#process_contest_input"
  # delete "/pageants", to: "pageants#destroy"
  # delete "/contestants", to: "contestants#destroy"
end