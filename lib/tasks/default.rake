# frozen_string_literal: true
if %w(development test).include? Rails.env
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task(:default).clear.enhance(['rubocop', 'db:environment:set', 'db:test:prepare', 'immigrant:check_keys', 'spec'])
end
