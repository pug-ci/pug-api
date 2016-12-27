# frozen_string_literal: true
module Api
  module V1
    class RepositoriesController < ApplicationController
      def show
        repository = current_user.repositories.find params[:id]
        render json: repository
      end

      def index
        repositories = current_user.repositories.order(:created_at)
        render json: repositories
      end

      def synchronize
        result = GithubFetcher.call user: current_user

        if result.success?
          render json: result.repositories
        else
          render json: { error: result.message }, status: result.status
        end
      end

      def connect
        repository = current_user.repositories.find params[:id]

        if repository.update(connected: true)
          render json: repository
        else
          render json: repository.errors, status: :unprocessable_entity
        end
      end

      def disconnect
        repository = current_user.repositories.find params[:id]

        if repository.update(connected: false)
          render json: repository
        else
          render json: repository.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
