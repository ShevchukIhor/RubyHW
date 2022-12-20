# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :articles do
        get :unpublished, :published
        patch :change_status
      end
      resources :comments do
        get :unpublished, :published
        patch :change_status
      end
      resources :likes
      resources :tags
    end
  end
end
