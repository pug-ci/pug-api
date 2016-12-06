# frozen_string_literal: true
class BuildCreator
  include Interactor

  def call
    @repository = Repository.find_by! github_id: context.repository_id
    config = fetch_repo_config

    create_build config
    publish_build if context.build&.pending?
  end

  private

  attr_reader :repository

  def create_build(config)
    build = repository.builds.new context.build_params
    build.config = config
    build.fail if config.nil?

    if build.save
      context.message = build
      context.status = 201
    else
      context.fail! message: build.errors, status: 422
    end
  end

  def fetch_repo_config
    config = github_client.fetch_config repository
    yml_string = Base64.decode64 config[:content]
    YAML.load yml_string
  rescue
    nil
  end

  def github_client
    @github_client ||= GithubClient.new
  end

  def publish_build
    publisher = Publisher.new
    publisher.publish context.build.to_json
  end
end
