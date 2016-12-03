# frozen_string_literal: true
Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'api/v1/sessions#create'

  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    namespace :v1 do
    end
  end
end
