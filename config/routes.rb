Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "/blog", to: "pages#blog"
  get "/braces", to: "pages#braces"
  get "/promise", to: "pages#promise"
  get "/results", to: "pages#results"

  resources :treatments, only: [:index, :show]

  resources :appointments, only: [:new, :create, :show] do
    resource :payments, only: [:create] do
      get :success
      get :cancel
    end
  end
  post "/webhooks/stripe", to: "webhooks#stripe"

  namespace :admin do
    resources :appointments
    resources :slots do
      collection do
        get :bulk_new
        post :bulk_create
      end
    end
  end
end
