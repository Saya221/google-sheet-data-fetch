# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "active_model_serializers"
gem "bcrypt"
gem "bootsnap", require: false
gem "config"
gem "figaro"
gem "google-api-client"
gem "googleauth"
gem "httparty", "~> 0.18.1"
gem "pagy"
gem "paranoia"
gem "pg", "~> 1.5", ">= 1.5.2"
gem "puma"
gem "rack-cors"
gem "rails", "~> 7.0.4"
gem "redis", "~> 5.0", ">= 5.0.6"
gem "sidekiq", "~> 7.0", ">= 7.0.9"

group :development, :test do
  gem "pry-rails"
end

group :development do
  gem "brakeman", require: false
  gem "listen"
  gem "rubocop", require: false
  gem "spring"
  gem "spring-watcher-listen"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
