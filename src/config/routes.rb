Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roadmaps
      get "users/whoami", to: "users#whoami"
      resources :users
      resources :likes, only: %i[create destroy]
      resources :tags, only: %i[index]
      namespace :admin do
        resources :users, only: [:index, :destroy]
        resources :roadmaps, only: [:index, :destroy]
      end
    end
  end
end
