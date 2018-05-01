Rails.application.routes.draw do
<<<<<<< HEAD
  get 'user/profile'

  resources :location_addresses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'location_addresses#index'
  resources :users, :only => [:show]
  resources :users
=======
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
>>>>>>> parent of 154725f... Added columns to user, generated location_address table and added initial location seed
end
