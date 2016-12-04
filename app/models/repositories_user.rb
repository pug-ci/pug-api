# frozen_string_literal: true
class RepositoriesUser < ApplicationRecord
  belongs_to :repository
  belongs_to :user

  validates :repository_id, uniqueness: { scope: :user_id }
end
