source 'https://rubygems.org'

gem 'sinatra'

gem 'activesupport'

gem 'dotenv'
gem 'rake'

gem 'mongoid', '~> 6.2.1'

gem 'bcrypt'

gem 'pundit'

gem 'draper'

group :development, :test do
  gem 'pry'

  gem 'yard'
  gem 'yard-mongoid'
  gem 'yard-sinatra'
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
