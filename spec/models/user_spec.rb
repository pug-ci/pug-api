# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
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
