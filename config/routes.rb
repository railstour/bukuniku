Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  resource :reviews, only: [:create]

  resources :checkouts, only: [:index]
  resource :checkout, only: [:new, :create] do
    get 'callback' => 'checkout#callback'
  end
end
