# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Repository, type: :model do
  describe 'validate associations' do
    it { is_expected.to have_many(:repositories_users).dependent :destroy }
    it { is_expected.to have_many(:users).through :repositories_users }
  end

  describe 'validate attributes' do
    subject { build :repository }

    it { is_expected.to validate_presence_of :github_id }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :url }

    it { is_expected.to validate_uniqueness_of(:github_id) }
    it { is_expected.to validate_uniqueness_of(:token) }
  end
end
