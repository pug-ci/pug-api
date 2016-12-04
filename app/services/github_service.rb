# frozen_string_literal: true
class GithubService
  def initialize(user)
    @client = Octokit::Client.new access_token: user.oauth_token
  end

  def repositories
    @repositories ||= @client.repos
  end

  def create_hook(repository)
    @client.create_hook(repository.github_id, 'web', hook_config, hook_options)
  end

  private

  def hook_config
    { url: "#{Rails.application.secrets.host}/webhooks", content_type: 'json' }
  end

  def hook_options
    { events: %w(push pull_request), active: true }
  end
end
