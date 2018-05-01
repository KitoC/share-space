Rails.application.routes.draw do
  get 'user/profile'

  resources :location_addresses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'location_addresses#index'
  resources :users, :only => [:show]
  resources :users
end
