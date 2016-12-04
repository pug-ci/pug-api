# frozen_string_literal: true
class GithubClient
  WEBHOOK_EVENTS = %w(push pull_request).freeze

  def initialize(user)
    @client = Octokit::Client.new access_token: user.oauth_token
  end

  def repositories
    @repositories ||= @client.repos
  end

  def create_hook(repository)
    @client.create_hook(
      repository.github_id,
      'web',
      { url: "#{Rails.application.secrets.host}/builds", content_type: 'json' },
      events: WEBHOOK_EVENTS, active: true
    )
  end

  private

  def webhooks_url
    host = Rails.application.secrets.host
    host.concat('/') if host.last != '/'

    host.concat('builds')
  end
end