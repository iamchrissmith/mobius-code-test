Rails.application.routes.draw do
  root to: "users#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :index]

  resources :transactions, only: [:create]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :users do
        get '/current', to: 'current#show'
      end
    end
  end
end
