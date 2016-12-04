# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rack-cors'

gem 'omniauth-github'
gem 'jwt'
gem 'active_model_serializers', '~> 0.10.0'
gem 'aasm', '~> 4.11', '>= 4.11.1'
gem 'octokit'

group :development do
  gem 'overcommit', '~> 0.37.0'
  gem 'brakeman', require: false
  gem 'listen'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rubocop', '~> 0.43.0', require: false
  gem 'rubocop-rspec'
  gem 'immigrant'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end
