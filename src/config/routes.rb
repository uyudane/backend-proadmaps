Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roadmaps
      get 'profiles/whoami',to: 'profiles#whoami'
      resources :profiles
    end
  end
end
