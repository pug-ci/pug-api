# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate attributes' do
    it { is_expected.to validate_presence_of :provider }
    it { is_expected.to validate_presence_of :uid }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :oauth_token }

    it { is_expected.to validate_inclusion_of(:provider).in_array described_class::VALID_PROVIDERS }
  end
end
