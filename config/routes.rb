Rails.application.routes.draw do

  resources :bookings
  resources :sharespaces
  resources :photos
  resources :albums
  resources :sharespace_venues
  resources :addresses
  resources :charges
  resources :reviews

  devise_for :users
  resources :users


  get 'profile', to: 'users#profile'
  get 'admin', to: 'users#admin'


  post '/search', to: 'sharespace_venues#index'
  get '/search', to: 'sharespace_venues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'

end
