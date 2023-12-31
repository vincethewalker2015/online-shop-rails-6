source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'devise-bootstrap-views', '~> 1.0'
# Use Jquery
gem 'jquery-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.2', '>= 4.2.5'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use GON If you need to send some data to your js files and you don't want to do this with long way 
gem 'gon', '~> 6.4'
gem 'hirb', '~> 0.7.3'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# USE Devise for User Authentication
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'faker'
# Use Carrier Wave for Image Uplaod
gem 'carrierwave', '~> 2.1'
gem 'mini_magick', '~> 4.11'
# Use Figaro to keep some features Secret
gem 'figaro', '~> 1.2'
# Use Braintree for payments
gem 'braintree', '~> 3.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'dotenv-rails'
  gem 'pry-byebug'
  gem 'pry', '~> 0.13.1'
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'guard', '~> 2.16', '>= 2.16.2'
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
end

group :production do 
  gem 'fog-aws', '~> 3.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
