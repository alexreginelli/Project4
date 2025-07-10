Rails.application.routes.draw do
  get "develop_cocktails/new"
  get "develop_cocktails/create"
  get "develop_cocktails/index"
  get "develop_cocktails/show"
  get "games/index"
  get "games/show"
  get "games/submit"
  get "cocktails/index"
  get "cocktails/new"
  get "cocktails/create"
  get "cocktails/show"
  get "ingredients/new"
  get "ingredients/create"
  #get "user/new"
  #get "user/create"
  #get "dashboard/index"
  #get "sessions/new"
  #get "sessions/create"
  #get "sessions/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "sessions#new"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "dashboard#index"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/users", to: "users#index"
  get "/ingredients/new", to: "ingredients#new", as: "new_ingredient"
  post "/ingredients", to: "ingredients#create"
  get "/ingredients", to: "ingredients#index"
  get "/cocktail_game", to: "games#index", as: "cocktail_game"
  get "/cocktail_game/:id", to: "games#show", as: "play_cocktail_game"
  post "/cocktail_game/:id/submit", to: "games#submit", as: "submit_cocktail_guess"
  resources :cocktails, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :ingredients, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :develop_cocktails
end
