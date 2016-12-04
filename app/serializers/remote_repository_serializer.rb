# frozen_string_literal: true
class RemoteRepositorySerializer < ActiveModel::Serializer
  attributes :github_id, :name, :url, :owner, :connected

  delegate :name, :url, to: :object

  def github_id
    object.id
  end

  def owner
    object.owner.login
  end

  def connected
    @instance_options[:connected_ids].include? object.id.to_s
  end
end
