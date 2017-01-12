# frozen_string_literal: true
class BuildCreator
  include Interactor

  def call
    @repository = Repository.find_by! github_id: context.repository_id

    config  = fetch_repo_config
    build   = create_build config

    publish(build) if build.pending?
  end

  private

  attr_reader :repository

  def fetch_repo_config
    github_client = GithubClient.new
    github_client.fetch_config repository
  end

  def create_build(config)
    repository.builds.new(context.build_params).tap do |build|
      build.config = config
      build.fail if config.nil?

      if build.save
        context.message = build
        context.status = 201
      else
        context.fail! message: build.errors, status: 422
      end
    end
  end

  def publish(build)
    publisher = Publisher.new
    publisher.publish Rabbit::BuildSerializer.new(build).to_json
  rescue Bunny::TCPConnectionFailedForAllHosts
    build.cancel!
    context.fail! message: { error: 'Service failure' }, status: 500
  end
end
