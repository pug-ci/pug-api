# frozen_string_literal: true
class Repository < ApplicationRecord
  has_secure_token :token

  has_many :builds, dependent: :destroy
  has_many :repositories_users, dependent: :destroy
  has_many :users, through: :repositories_users

  validates :github_id, :name, :url, presence: true
  validates :github_id, :token, uniqueness: true
  validates :github_id, numericality: { greater_than: 0, only_integer: true }
end
