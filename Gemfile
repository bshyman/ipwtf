source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source "https://gems.rapidrailsthemes.com/gems" do
  gem "rrt", "~> 1.2.9"
end

gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'jquery-rails'
gem 'bootbox-rails', '~>0.4'
gem 'pg'
gem 'net-ping'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem 'better_errors'
  # gem "capistrano", "~> 3.10", require: false
  # gem "capistrano-rails", "~> 1.4", require: false
  # gem 'capistrano-bundler'
  # gem 'capistrano-rails-console'
  # gem 'capistrano-rvm'
  gem 'foreman'
  gem 'rails_layout'
  gem 'binding_of_caller'
  gem 'bcrypt'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rubocop-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'faker'
end

group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'fabrication'
  gem "minitest-rails-capybara"
end