module Carto
  module Errors

    # An error for a request that wasn't formed correctly.
    class InvalidRequest < Error

      # Create a new invalid request.
      #
      # @see Carto::Errors::Error#initialize
      #
      # @option attributes [Integer] :status The HTTP status code.
      # @option attributes [String] :type The type of error.
      # @option attributes [String] :message The message to give.
      # @return [Carto::Errors::InvalidRequest]
      def initialize(attributes = {})
        super({
          status: 400,
          type: :invalid_request
        }.merge!(attributes))
      end
    end
  end
end
