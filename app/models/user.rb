# frozen_string_literal: true
class User < ApplicationRecord
  VALID_PROVIDERS = %w(github).freeze

  validates :provider, :uid, :name, :oauth_token, presence: true
  validates :provider, inclusion: VALID_PROVIDERS

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    user.name             = auth.info.name
    user.oauth_token      = auth.credentials.token
    user.oauth_expires_at = Time.zone.at(auth.credentials.expires_at) if auth.credentials.expires

    user.save!
  end
end
