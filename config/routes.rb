Rails.application.routes.draw do
  devise_for :user

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create do
        resources :channels, only: [:index, :create, :update] do
          resources :announcements, only: [:index, :create]
        end
      end
      resources :sessions, only: [:create, :destroy]

      resources :home, path: :channels, as: :channels, only: [:index, :show]
    end
  end
end
