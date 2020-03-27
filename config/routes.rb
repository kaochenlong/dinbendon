Rails.application.routes.draw do
  get "/login", to: "users#login"

  root "welcome#index"
end

