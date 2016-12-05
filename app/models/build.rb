# frozen_string_literal: true
class Build < ApplicationRecord
  include AASM

  belongs_to :repository

  validates :ref, :commit_id, :commit_url, :commit_message, :committer_username, presence: true

  aasm column: :status, no_direct_assignment: true do
    state :pending, initial: true
    state :running
    state :passed
    state :failed
    state :cancelled

    event :start do
      transitions from: :pending, to: :running
    end

    event :pass do
      transitions from: :running, to: :passed
    end

    event :fail do
      transitions from: :running, to: :failed
    end

    event :cancel do
      transitions from: [:pending, :running], to: :cancelled
    end
  end
end
