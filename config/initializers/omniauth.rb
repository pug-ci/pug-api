# frozen_string_literal: true
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.omniauth[:github_id], Rails.application.secrets.omniauth[:github_secret],
           scope: 'repo:status,write:repo_hook,read:org'
end
