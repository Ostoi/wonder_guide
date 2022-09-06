Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", action: :show, controller: "users"

 resources :sights
  resources :user
  resources :citytours do
    resources :citytour_sights, only: :create
    resources :bookings, only: :create do
      resources :reviews, only: :create
    end
  end
end
