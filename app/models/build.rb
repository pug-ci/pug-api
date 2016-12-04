# frozen_string_literal: true
class Build < ApplicationRecord
  include AASM

  belongs_to :repository

  aasm column: :status, no_direct_assignment: true do
    state :pending, initial: true
    state :running
    state :passed
    state :failed
    state :canceled

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
      transitions from: [:pending, :running], to: :canceled
    end
  end
end
