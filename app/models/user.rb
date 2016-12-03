# frozen_string_literal: true
class User < ApplicationRecord
  VALID_PROVIDERS = %w(github).freeze

  has_many :repositories_users, dependent: :destroy
  has_many :repositories, through: :repositories_users

  validates :provider, :uid, :name, :oauth_token, presence: true
  validates :provider, inclusion: VALID_PROVIDERS
  validates :provider, uniqueness: { scope: :uid }

  def self.from_omniauth(auth)
    find_or_initialize_by(provider: auth.provider, uid: auth.uid).tap do |user|
      user.name             = auth.info.name
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.zone.at(auth.credentials.expires_at) if auth.credentials.expires
    end
  end
end
