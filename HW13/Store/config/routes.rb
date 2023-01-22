# frozen_string_literal: true

Rails.application.routes.draw do
  # admin section
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # users section
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'products#index'
  resources :products
  resources :categories
  resources :line_items, only: %i[create update destroy]
  resources :orders
  get '/cart', to: 'carts#show', as: :cart
  get 'orders/:id' => 'orders#update', as: 'orders_confirm'
end

# == Route Map
#
