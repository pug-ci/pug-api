# frozen_string_literal: true
FactoryGirl.define do
  factory :repositories_user do
    association :repository
    association :user
  end
end
