# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Build, type: :model do
  describe 'validate associations' do
    it { is_expected.to belong_to :repository }
  end

  describe 'validate attributes' do
    it { is_expected.to validate_presence_of :ref }
    it { is_expected.to validate_presence_of :commit_id }
    it { is_expected.to validate_presence_of :commit_url }
    it { is_expected.to validate_presence_of :commit_message }
    it { is_expected.to validate_presence_of :committer_username }
  end
end
