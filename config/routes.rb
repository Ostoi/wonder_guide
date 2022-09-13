Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  get "dashboard", action: :dashboard, controller: "dashboard"

  resources :sights do
   resources :citytour_sights, only: :create
  end
  resources :user
  resources :citytours do
    resources :sights, only: [] do
      resources :citytour_sights, only: [] do
        member do
          post :create
        end
     end
  end
    resources :citytour_sights, only: :create
    resources :bookings, only: [:index, :show, :create, :new] do
      resources :reviews, only: :create
    end
  end
  resources :bookings, only: [] do
    member do
      get :accept
      get :deny
    end
  end
end
