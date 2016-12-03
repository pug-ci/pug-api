# frozen_string_literal: true
module Api
  module V1
    class CurrentUserController < ApplicationController
      def show
        render json: current_user
      end
    end
  end
end
