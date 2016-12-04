# frozen_string_literal: true
FactoryGirl.define do
  factory :repository do
    github_id { FFaker.numerify('######') }
    token     { FFaker::Guid.guid }
    name      { FFaker::Name.name }
    url       { FFaker::Internet.http_url }
  end
end
