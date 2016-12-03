# frozen_string_literal: true
module Api
  module V1
    class SessionsController < ApplicationController
      def create
        User.from_omniauth request.env['omniauth.auth']
        redirect_to Rails.application.secrets.omniauth[:session_create_redirect]
      end
    end
  end
end
