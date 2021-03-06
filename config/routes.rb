# frozen_string_literal: true
Rails.application.routes.draw do
  get :ping, to: 'ping#index'

  namespace :github, path: '' do
    get '/auth/:provider/callback', to: 'sessions#create'
    resources :builds, only: :create
  end

  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
      get 'current_user', to: 'current_user#show'

      resources :repositories, only: [:show, :index] do
        collection do
          get :synchronize
        end
        member do
          put :connect
          put :disconnect
        end
        resources :builds, only: [:show, :index]
      end
    end
  end
end
