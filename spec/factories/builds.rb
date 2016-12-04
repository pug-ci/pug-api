# frozen_string_literal: true
FactoryGirl.define do
  factory :build do
    association :repository
  end
end
