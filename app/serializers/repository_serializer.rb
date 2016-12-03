# frozen_string_literal: true
class RepositorySerializer < ActiveModel::Serializer
  attributes :id, :name, :url
end
