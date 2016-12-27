# frozen_string_literal: true
class RepositoryDisconnector
  include Interactor

  def call
    remove_webhook

    return if context.repository.update connected: false, github_webhook_id: nil

    context.fail! message: context.repository.errors
  end

  private

  def remove_webhook
    GithubClient.new(context.user.oauth_token).remove_hook context.repository
  rescue
    context.fail! message: 'Could not remove github webhook'
  end
end
