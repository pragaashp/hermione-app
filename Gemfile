source 'http://rubygems.org'

ruby '2.3.0'
gem 'rails', '4.2.6'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'autoprefixer-rails'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'haml'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rubycas-client-rails', :git => 'git://github.com/creativecommons/rubycas-client-rails.git'

group :development, :test do
  gem 'byebug'              # Debugger.
  gem 'spring'              # Run App in Background.
  gem 'sqlite3'             # Development & Test Database.
  gem 'jasmine-rails'
  gem 'database_cleaner', '1.4.1'
  gem 'launchy'
  gem 'ZenTest', '4.11.0'
end

group :test do
  gem 'rspec-rails', '3.3.2'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'capybara', '2.4.4'
  gem 'autotest-rails'
  gem 'simplecov', :require => false
  gem "codeclimate-test-reporter", :require => nil
  gem 'factory_girl_rails'
  gem 'metric_fu'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'pg'                   # Heroku Deployment.
  gem 'rails_12factor'
end