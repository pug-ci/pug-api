# frozen_string_literal: true
module Api
  module V1
    class BuildsController < ApplicationController
      before_action :set_repository

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
