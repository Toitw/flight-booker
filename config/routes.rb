Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root index
  resources :flights
  resources :airports
  resources :bookings, only: [:new, :create, :show]
  resources :passengers

  root "flights#index"
  get "bookings/:id", to: "bookings#show"

end
