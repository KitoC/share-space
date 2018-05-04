Rails.application.routes.draw do

  resources :bookings
  resources :sharespaces
  resources :photos
  resources :albums
  resources :sharespace_venues
  resources :addresses
  devise_for :users
  resources :users
  post '/search', to: 'sharespace_venues#index'
  get '/search', to: 'sharespace_venues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sharespace_venues#index'

end
