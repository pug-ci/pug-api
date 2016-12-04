# frozen_string_literal: true
class BuildSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at
end
