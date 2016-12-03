# frozen_string_literal: true
class User < ApplicationRecord
  VALID_PROVIDERS = %w(github).freeze

  validates :provider, :uid, :name, :oauth_token, presence: true
  validates :provider, inclusion: VALID_PROVIDERS
end
