Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth: 'users/omniauth',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :books, only: [:show]
  resources :carts, only: [:create, :index]
  resource :cart_details, only: [:update, :destroy]
end
