Rails.application.routes.draw do
  get "/login", to: "users#login"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

  root "welcome#index"
end

