Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments, only: %i[create show edit destroy] do
          get :published
          get :unpublished
        end
        end
    end
  end
end
