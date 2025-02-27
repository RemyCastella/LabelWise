Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  resources :scans, only: [:index, :show, :create]
  resources :foods, only: [:show, :create]
  resources :users, only: [:update]
  get "favorite/:id", to: "foods#favorite", as: :favorite
  get "unfavorite/:id", to: "foods#unfavorite", as: :unfavorite
  get "/profile", to: "users#profile", as: :profile
  patch '/profile', to: 'users#update'


end
