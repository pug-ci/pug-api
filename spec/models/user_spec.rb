# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate associations' do
    it { is_expected.to have_many(:repositories_users).dependent :destroy }
    it { is_expected.to have_many(:repositories).through :repositories_users }
  end

  describe 'validate attributes' do
    subject { build :user }

    it { is_expected.to validate_presence_of :provider }
    it { is_expected.to validate_presence_of :uid }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :oauth_token }

    it { is_expected.to validate_inclusion_of(:provider).in_array described_class::VALID_PROVIDERS }
    it { is_expected.to validate_uniqueness_of(:provider).scoped_to :uid }
  end
end
