Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  get "dashboard", action: :dashboard, controller: "dashboard"

  resources :sights
  resources :user
  resources :citytours do
    resources :citytour_sights, only: :create
    resources :bookings, only: [:index, :show, :create, :new] do
    end
  end
  resources :bookings, only: [] do
    member do
      get :accept
      get :deny
    end
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]
end
