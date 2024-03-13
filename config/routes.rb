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
  resources :buddies, only: %i[index new create show] do
    member do
      get 'send_schedule'
    end
  end

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
      get :offering_option
    end

    get 'illness/:illness_id', to: "plants#add_diagnosis", as: :add_diagnosis
    delete 'illness/:illness_id', to: "plants#remove_diagnosis", as: :remove_diagnosis
  end

  resources :offers, only: %i[index show new create] do
    member do
      get 'chat'
      patch 'accepted'
      get 'default_message'
    end

    get "/offering_options/new", to: "offering_options#new"
    post "/offering_options", to: "offering_options#create"

    resources :messages, only: :create
  end

  resources :plant_infos, only: %i[new create show]  do
    resources :plants, only: %i[new create show]
  end


  get "/diagnose", to: "diagnosis#diagnose"
  get "/diagnose/results", to: "diagnosis#results"
  post "/diagnose/results", to: "diagnosis#results"
  get "/diagnose/add-plants", to: "diagnosis#addplants"
  get '/plants/plant_id', to: "plants#add_collection", as: :add_collection

  get "schedule/:token", to: "plants#share"
  get "identify/results", to: "identify#results"
  post "identify/results", to: "identify#results"
  get "identify/details", to: "identify#details"

end
