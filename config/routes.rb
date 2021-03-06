Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :todos

  get  '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy', as: 'logout'

  post   "oauth/callback" => "oauths#callback"
  get    "oauth/callback" => "oauths#callback" # for use with Github
  get    "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  delete "oauth/:provider" => "oauths#destroy", :as => :delete_oauth

  root 'todos#index'
end
