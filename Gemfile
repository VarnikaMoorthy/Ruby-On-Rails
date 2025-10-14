# Gemfile

source "https://rubygems.org"

ruby "3.4.7"

# Rails framework
gem "rails", "~> 7.1.5", ">= 7.1.5.2"

# Asset pipeline
gem "sprockets-rails"

# SQLite3 (for default/test databases)
gem "sqlite3", "~> 1.6"

# Web server
gem "puma", ">= 5.0"

# JavaScript with import maps
gem "importmap-rails"

# Hotwire Turbo & Stimulus
gem "turbo-rails"
gem "stimulus-rails"

# JSON API builder
gem "jbuilder"

# Windows timezone support
gem "tzinfo-data", platforms: %i[ windows jruby ]

# SQL Server support
gem "tiny_tds"                     # SQL Server client
gem "activerecord-sqlserver-adapter"

# Authentication
gem "bcrypt", "~> 3.1.7"

# Boot optimization
gem "bootsnap", require: false

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Web console for debugging
  gem "web-console"

  # Uncomment to speed up commands with Spring
  # gem "spring"
end

group :test do
  # System testing
  gem "capybara"
  gem "selenium-webdriver"
end
