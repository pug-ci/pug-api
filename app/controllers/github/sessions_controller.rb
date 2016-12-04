# frozen_string_literal: true
module Github
  class SessionsController < ApplicationController
    skip_before_action :authenticate_request!, only: :create

    def create
      @current_user = User.from_omniauth request.env['omniauth.auth']
      if current_user.save
        redirect_to after_sign_in_path
      else
        redirect_to Rails.application.secrets.frontend_url
      end
    end

    private

    def after_sign_in_path
      path      = Rails.application.secrets.frontend_url
      jwt_token = JsonWebToken.encode user_id: current_user.id

      "#{path}?auth_token=#{jwt_token}"
    end
  end
end
