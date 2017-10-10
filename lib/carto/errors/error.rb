module Carto
  module Errors

    # A standard error base class.
    class Error < StandardError
      attr_reader :status, :type, :message

      # Raise a new error.
      #
      # @option attributes [Integer] :status The HTTP status code.
      # @option attributes [String] :type The type of error.
      # @option attributes [String] :message The message to give.
      # @return [Carto::Errors::Error] A new error!
      def initialize(attributes)
        @status = attributes[:status]
        @type = attributes[:type]
        @message = attributes[:message]
      end
    end
  end
end
