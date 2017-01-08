# frozen_string_literal: true
module Rabbit
  class BuildSerializer < ActiveModel::Serializer
    attributes :id, :status, :created_at, :ref, :commit_id, :commit_url, :commit_message, :committer_username, :config
    belongs_to :repository

    delegate :config, to: :object
  end
end
