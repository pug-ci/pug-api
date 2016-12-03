# frozen_string_literal: true
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.omniauth[:github_id], Rails.application.secrets.omniauth[:github_secret]
end
