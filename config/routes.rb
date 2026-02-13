Rails.application.routes.draw do
  devise_for :users
  # Top-level indexes so navbar can link to matches/proposals across the site
  resources :matches, only: [:index, :destroy]
  # Allow creating proposals from a top-level form as well as nested under a sock
  resources :proposals, only: [:index, :new, :create] do
    member do
      post :accept
      post :reject
    end
  end
  resources :socks do
    resources :matches
    resources :proposals
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "welcome#index"
end
