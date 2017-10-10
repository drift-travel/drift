module Carto
  module Extensions
    class ErrorHandler
      CONTENT_TYPE = { 'Content-Type' => 'application/json' }.freeze

      # Register with the app.
      #
      # @param [Sinatra::Application] app The Rack app.
      # @return [Carto::Extensions::ErrorHandler]
      def initialize(app)
        @app = app
      end

      def handle_error(e)
        error =
          case e
          when Mongoid::Errors::Validations
            Carto::Errors::InvalidRequest.new(message: e.document.errors.details)
          when ActiveInteraction::InvalidInteractionError
            Carto::Errors::InvalidRequest.new(message: e.message)
          when JSON::ParserError
            Carto::Errors::InvalidRequest.new(message: 'Problem parsing JSON')
          when Mongoid::Errors::DocumentNotFound
            Carto::Errors::NotFound.new
          when Sinatra::NotFound
            Carto::Errors::NotFound.new
          when Carto::Errors::Error
            e
          else
            Carto::Errors::APIError.new(message: e.message)
          end

        [error.status, CONTENT_TYPE, [Rabl.render(error, 'error')]]
      end

      def call(env)
        response = @app.call(env)
        raise env['sinatra.error'] if env['sinatra.error']
        response
      rescue => e
        handle_error(e)
      end
    end
  end
end
