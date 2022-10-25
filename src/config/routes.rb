Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roadmaps
      resources :profiles
    end
  end
end
