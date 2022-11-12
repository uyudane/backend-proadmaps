Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roadmaps
      get 'users/whoami',to: 'users#whoami'
      resources :users
      resources :likes, only: %i[create destroy]
      resources :tags, only: %i[index]
    end
  end
end
