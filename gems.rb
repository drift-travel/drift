source 'https://rubygems.org'

gem 'sinatra'

gem 'rake'
gem 'dotenv'

gem 'mongoid', '~> 6.2.1'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'mongoid-rspec', github: 'mongoid/mongoid-rspec'
  gem 'factory_girl'
  gem 'database_cleaner'
end
