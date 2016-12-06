# frozen_string_literal: true
class GithubClient
  WEBHOOK_EVENTS = %w(push pull_request).freeze

  def initialize(oauth_token = nil)
    @client = Octokit::Client.new access_token: oauth_token
  end

  def repositories
    @repositories ||= client.repos
  end

  def create_hook(repository)
    client.create_hook(
      repository.github_id,
      'web',
      { url: "#{Rails.application.secrets.host}/builds", content_type: 'json' },
      events: WEBHOOK_EVENTS, active: true
    )
  end

  def fetch_config(repository)
    client.contents repository.github_id, path: Rails.application.secrets.config_file_path
  rescue Octokit::NotFound
    nil
  end

  private

  attr_reader :client

  def webhooks_url
    host = Rails.application.secrets.host
    host.concat('/') if host.last != '/'

    host.concat('builds')
  end
end
