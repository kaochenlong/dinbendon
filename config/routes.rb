Rails.application.routes.draw do
  root "items#index"

  resources :categories

  resources :items do 
    member do
      post :add_to_cart
    end

    resources :comments, only: [:create]
  end

  # cart
  # post "/abc/:id", to: "cart#add", as: :cc

  resource :cart, only: [:show, :destroy]

  # users
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

  # APIs
  namespace :api do
    namespace :v1 do
      resources :items, only: [] do
        member do
          post :favorite
        end
      end
    end
  end
end

