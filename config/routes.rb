Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resources :sessions, only: [:create, :destroy]
    end
  end
end
