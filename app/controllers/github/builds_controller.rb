# frozen_string_literal: true
module Github
  class BuildsController < ApplicationController
    skip_before_action :authenticate_request!, only: :create
    before_action :check_event_type, only: :create

    def create
      result = BuildCreator.call repository_id: params[:repository][:id], build_params: build_params
      render json: result.message, status: result.status
    end

    private

    def check_event_type
      return if GithubClient::WEBHOOK_EVENTS.include? request.headers['X-GitHub-Event']

      head :no_content
    end

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
