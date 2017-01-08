# frozen_string_literal: true
class PingController < ApplicationController
  skip_before_action :authenticate_request!, only: :index

  def index
    render json: { message: 'pong' }
  end
end
