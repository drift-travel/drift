require 'mongoid'

Mongoid.load!(File.expand_path('../../../config/mongoid.yml', __FILE__))

module Arrow
  module Models
  end
end

require_relative 'models/user'
require_relative 'models/trip'
