# frozen_string_literal: true

Rails.application.routes.draw do
  get '/cart', to: 'carts#show', as: :cart
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
  resources :line_items, only: :create
  resources :orders, only: %i[show create update]
  get 'line_items/:id' => 'line_items#destroy', as: 'line_item'
  get 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  get 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
end
