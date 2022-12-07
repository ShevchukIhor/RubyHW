Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :articles do
        resources :comments, only: %i[index create show edit destroy]
      end
      resources :comments, only: %i[index create show edit destroy]
    end
  end
end
