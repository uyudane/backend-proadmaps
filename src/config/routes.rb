Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roadmaps
    end
  end
end
