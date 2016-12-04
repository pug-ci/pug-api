# frozen_string_literal: true
Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'api/v1/sessions#create'

  namespace :github, path: '' do
    resources :builds, only: :create
  end

  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
      get 'current_user', to: 'current_user#show'

      resources :repositories, only: [:show, :index, :create] do
        collection do
          get 'remote', to: 'repositories#remote'
        end
        resources :builds, only: :index
      end
    end
  end
end
