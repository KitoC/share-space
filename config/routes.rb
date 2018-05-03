Rails.application.routes.draw do

  resources :photos
  resources :albums
  resources :collab_space_listings
  resources :addresses
  devise_for :users
  resources :users
  post '/search', to: 'collab_space_listings#index'
  get '/search', to: 'collab_space_listings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'collab_space_listings#index'

end
