# frozen_string_literal: true
class RemoteRepositorySerializer < ActiveModel::Serializer
  attributes :github_id, :name, :owner

  delegate :name, to: :object

  def github_id
    object.id
  end

  def owner
    object.owner.login
  end
end
