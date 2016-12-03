# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RepositoriesUser, type: :model do
  describe 'validate associations' do
    it { is_expected.to belong_to :repository }
    it { is_expected.to belong_to :user }
  end

  describe 'validate attributes' do
    subject { build :repositories_user }

    it { is_expected.to validate_presence_of :repository }
    it { is_expected.to validate_presence_of :user }

    it { is_expected.to validate_uniqueness_of(:repository_id).scoped_to :user_id }
  end
end
