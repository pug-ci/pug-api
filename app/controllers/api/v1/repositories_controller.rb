# frozen_string_literal: true
module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        repositories = current_user.repositories
        render json: repositories
      end
    end
  end
end
