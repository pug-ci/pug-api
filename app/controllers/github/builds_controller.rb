# frozen_string_literal: true
module Github
  class BuildsController < ApplicationController
    skip_before_action :authenticate_request!, only: :create

    def create
      repository  = Repository.find_by! github_id: params[:repository][:id]
      build       = repository.builds.new

      if build.save
        head :no_content
      else
        head :unprocessable_entity
      end
    end
  end
end
