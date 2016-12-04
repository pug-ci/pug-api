# frozen_string_literal: true
class GithubService
  def initialize(user)
    @client = Octokit::Client.new access_token: user.oauth_token
  end

  def repositories
    @repositories ||= @client.repos
  end
end
