# frozen_string_literal: true
module Api
  module V1
    class RepositoriesController < ApplicationController
      def show
        repository = current_user.repositories.find params[:id]
        render json: repository
      end

      def index
        repositories = current_user.repositories
        render json: repositories
      end

      def remote
        github = GithubService.new current_user
        render json: github.repositories, each_serializer: RemoteRepositorySerializer
      end
    end
  end
end
