# frozen_string_literal: true
class RepositoryConnector
  include Interactor

  def call
    hook = create_webhook

    return if context.repository.update connected: true, github_webhook_id: hook.id

    context.fail! message: context.repository.errors
  end

  private

  def create_webhook
    GithubClient.new(context.user.oauth_token).create_hook context.repository
  rescue
    context.fail! message: 'Could not create github webhook'
  end
end
