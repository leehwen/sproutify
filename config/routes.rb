Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :collections, only: %i[new create index show destroy]

  resources :plants do
    resources :collections, only: %i[new create edit update]

    collection do
      get 'listings'
    end
    member do
      get 'edit_schedule'
      patch 'update_schedule'
      get 'listing'
      patch 'update-listing'
    end
    get 'illness/:illness_id', to: "plants#add_diagnosis", as: :add_diagnosis
    delete 'illness/:illness_id', to: "plants#remove_diagnosis", as: :remove_diagnosis
  end

  resources :offers, only: %i[new create] do
    member do
      patch 'accepted'
    end
  end

  resources :plant_infos, only: %i[new create show]  do
    resources :plants, only: %i[new create show]
  end

  get "/diagnose", to: "diagnosis#diagnose"
  get "/diagnose/results", to: "diagnosis#results"
  post "/diagnose/results", to: "diagnosis#results"
  get "/diagnose/add-plants", to: "diagnosis#addplants"
  get '/plants/plant_id', to: "plants#add_collection", as: :add_collection

  get "schedule", to: "plants#share"
  get "identify/results", to: "identify#results"
  post "identify/results", to: "identify#results"
  get "identify/details", to: "identify#details"

  resources :chatrooms, only: :show

  # resources :identity do
  #   collection do
  #     get
  #     get :results
  #     get :details
  #   end
  # # end
  # get "identify", to: "identify#search"
  # get "identify/results", to: "identify#results"
  # post "identify/results", to: "identify#results"
  # get "identify/details", to: "identify#details"

end
