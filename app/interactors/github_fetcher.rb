# frozen_string_literal: true
class GithubFetcher
  include Interactor

  def call
    context.repositories = github.repositories.map do |remote_repository|
      synchronize_repository remote_repository
    end

    context.user.repositories = context.repositories
  end

  private

  def synchronize_repository(remote_repository)
    Repository.find_or_initialize_by(github_id: remote_repository.id).tap do |repository|
      repository.name   = remote_repository.name
      repository.url    = remote_repository.url
      repository.owner  = remote_repository.owner.login
      repository.save!
    end
  rescue ActiveRecord::RecordInvalid
    context.fail! message: 'Unable to synchronize github repository', status: 422
  end

  def github
    @github ||= GithubClient.new context.user.oauth_token
  end
end
