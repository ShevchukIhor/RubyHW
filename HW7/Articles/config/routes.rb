Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :authors, only: %i[new create edit update]
      resources :articles do
        resources :comments, only: %i[new edit create destroy published unpublished]
        get :unpublished, :published, :last_ten_comments
        resources :likes
      end
      resources :comments, except: %i[new show] do
        resources :articles, only: %i[create destroy]
        get :unpublished, :published, :last_ten_comments
        resources :likes
      end



    end
  end
end
