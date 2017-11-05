source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-router'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'sinatra_warden'

gem 'puma'

gem 'activesupport'

gem 'dotenv'
gem 'rake'

gem 'mongoid', '~> 6.2.1'

gem 'bcrypt'

gem 'pundit'

gem 'draper'

gem 'oj'

gem 'active_interaction'

gem 'graphql'

gem 'haml'

group :development, :test do
  gem 'pry'

  gem 'yard'
  gem 'yard-mongoid'
  gem 'yard-sinatra'

  gem 'foreman'
end

group :test do
  gem 'rack-test'
  gem 'rspec'

  gem 'mongoid-rspec', github: 'mongoid/mongoid-rspec'

  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'timecop'

  gem 'rubocop'
  gem 'simplecov'
end
