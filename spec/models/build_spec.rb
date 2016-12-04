# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Build, type: :model do
  describe 'validate associations' do
    it { is_expected.to belong_to :repository }
  end
end
