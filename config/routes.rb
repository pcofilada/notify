Rails.application.routes.draw do
  devise_for :user

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create do
        resources :channels, only: [:show, :index, :create, :update] do
          resources :announcements, only: [:index, :create]
        end
        member do
          get :subscribed
        end
      end
      resources :sessions, only: [:create, :destroy]

      resources :home, path: :channels, as: :channels, only: [:index, :show] do
        resource :subscription, only: :create
      end
    end
  end
end
