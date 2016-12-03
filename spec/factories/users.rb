# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    provider    { User::VALID_PROVIDERS.sample }
    uid         { FFaker::Guid.guid }
    name        { FFaker::Internet.user_name }
    oauth_token { FFaker::Guid.guid }
  end
end
