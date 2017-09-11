ENV['RACK_ENV'] ||= 'development'

require 'dotenv'

Dotenv.load

require_relative '../lib/gone'
