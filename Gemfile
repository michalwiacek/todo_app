# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4"

gem "puma", "~> 5.0"
gem "sqlite3", "~> 1.4"

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "panko_serializer"
gem "propshaft"
gem 'bcrypt', '~> 3.1.7'
gem 'simple_command'
gem 'jwt'

group :development do
  gem "rubocop", require: false
  gem "rubocop-github", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development, :test do
  gem "pry"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 6.0.0"
  gem "shoulda-matchers"
end
