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

      def create
        repository = Repository.create repository_params
        hook = GithubClient.new(current_user.oauth_token).create_hook repository
        repository.github_hook_id = hook[:id]

        if repository.save
          current_user.repositories << repository
          render json: repository, status: :created
        else
          render json: repository.errors, status: :unprocessable_entity
        end
      end

      def destroy
        repository = current_user.repositories.find params[:id]
        GithubClient.new(current_user.oauth_token).remove_hook repository

        repository.destroy
        head :no_content
      end

      def remote
        github = GithubClient.new current_user.oauth_token
        connected_ids = current_user.repositories.pluck(:github_id)
        render json: github.repositories, each_serializer: RemoteRepositorySerializer, connected_ids: connected_ids
      end

      private

      def repository_params
        params.require(:repository).permit(:github_id, :name, :url, :owner)
      end
    end
  end
end
