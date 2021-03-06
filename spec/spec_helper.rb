ENV['RACK_ENV'] = 'test'

require 'simplecov'

SimpleCov.start
SimpleCov.add_filter 'spec/*'

require 'rspec'
require 'rack/test'
require 'mongoid-rspec'

require 'factory_girl'
require 'database_cleaner'
require 'timecop'

require 'pry'

require_relative '../config/boot'

Dir['./spec/factories/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Rack::Test::Utils
  config.include Mongoid::Matchers
  config.include FactoryGirl::Syntax::Methods

  config.fail_fast = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
