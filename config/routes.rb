Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  get 'events/index'

  resources :users
  resources :events do
    get 'rsvp'
  end

  root "events#index"

end
