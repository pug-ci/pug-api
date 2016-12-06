# frozen_string_literal: true
module Github
  class BuildsController < ApplicationController
    skip_before_action :authenticate_request!, only: :create

    def create
      result = BuildsCreator.call repository_id: params[:repository][:id], build_params: build_params
      render json: result.message, status: result.status
    end

    private

    def build_params
      {
        ref: params[:ref],
        commit_id: params[:head_commit][:id],
        commit_url: params[:head_commit][:url],
        commit_message: params[:head_commit][:message],
        committer_username: params[:head_commit][:committer][:username]
      }
    end
  end
end
