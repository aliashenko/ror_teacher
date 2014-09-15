source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
gem 'bootstrap-sass', '2.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'ffaker'
gem 'therubyracer'
gem 'execjs'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'devise'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'jquery-turbolinks'
gem 'thin'
gem 'paperclip'
gem 'ckeditor'
gem 'ckeditor_rails'

gem 'lol_dba'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'simplecov', :require => false, :group => :test

group :test do
  gem 'factory_girl_rails', '4.2.1'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'minitest-rails'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'spring'
end
