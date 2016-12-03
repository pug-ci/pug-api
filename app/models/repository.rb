# frozen_string_literal: true
class Repository < ApplicationRecord
  has_secure_token :token

  validates :github_id, :name, :url, presence: true
  validates :github_id, :token, uniqueness: true
end
