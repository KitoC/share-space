Rails.application.routes.draw do

  resources :addresses
  resources :location_addresses
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'addresses#index'

end
