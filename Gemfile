# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.0"
gem "hanami-router", "~> 2.0"
gem "hanami-controller", "~> 2.0"
gem "hanami-validations", "~> 2.0"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "puma"
gem "rake"

# Views
gem "haml", "~> 6"
gem "phlex", "~> 1"

group :development, :test do
  gem "dotenv"
end

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :development do
  gem "guard-puma", "~> 0.8"
  gem "ruby_jard", "~> 0"
  gem "amazing_print", "~> 1.4"
  gem "pry-doc", "~> 1.4"
  gem "pry-theme", "~> 1.3"
  gem "hirb", "~> 0.7.3"
  gem "standard", "~> 1.24"
  gem "reek", "~> 6.1"
end

group :test do
  gem "rack-test"
end

gem "slim", "~> 5.0"
gem "hamlit", "~> 3.0"
gem "erb", "~> 4.0"
