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

  def remove_hook(repository)
    client.remove_hook(repository.github_id, repository.github_hook_id)
  end

  def fetch_config(repository)
    config = fetch_file repository, Rails.application.secrets.config_file_path
    return nil unless config

    yml_string = Base64.decode64 config[:content]
    YAML.load yml_string
  rescue
    nil
  end

  def fetch_file(repository, path)
    client.contents repository.github_id, path: path
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
