# frozen_string_literal: true
class BuildSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :ref, :commit_id, :commit_url, :commit_message, :committer_username

  def created_at
    I18n.l object.created_at, format: :short
  end
end
