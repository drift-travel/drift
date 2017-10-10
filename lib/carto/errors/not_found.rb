module Carto
  module Errors

    # An error for if the resource couldn't be found.
    class NotFound < InvalidRequest

      # Creates a new error with HTTP status code +404+ and the message
      # +"not found"+.
      #
      # @see Carto::Errors::InvalidRequest#initialize
      #
      # @return [Carto::Errors::NotFound]
      def initialize
        super(status: 404, message: 'not found')
      end
    end
  end
end
