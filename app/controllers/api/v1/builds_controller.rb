# frozen_string_literal: true
module Api
  module V1
    class BuildsController < ApplicationController
      before_action :set_repository

      def show
        build = @repository.builds.find params[:id]
        render json: build
      end

      def index
        builds = @repository.builds.order created_at: :desc
        render json: builds
      end

      private

      def set_repository
        @repository = Repository.find params[:repository_id]
      end
    end
  end
end
