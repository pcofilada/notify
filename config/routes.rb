Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create do
        resources :channels, only: [:index, :create, :update]
      end
      resources :sessions, only: [:create, :destroy]
    end
  end
end
