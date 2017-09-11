source 'https://rubygems.org'

gem 'sinatra'

gem 'dotenv'
gem 'rake'

gem 'mongoid', '~> 6.2.1'

gem 'bcrypt'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rack-test'
  gem 'rspec'

  gem 'mongoid-rspec', github: 'mongoid/mongoid-rspec'

  gem 'database_cleaner'
  gem 'factory_girl'

  gem 'rubocop'
  gem 'simplecov'

  gem 'yard'
  gem 'yard-sinatra'
end
