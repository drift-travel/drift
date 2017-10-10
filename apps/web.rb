require_relative 'web/app'

module Carto
  module Web
    def self.new
      Rack::Builder.new do
        # use Rover::Extensions::ErrorHandler

        # Rover::Extensions::Authentication.registered(self)

        run App
      end
    end
  end
end