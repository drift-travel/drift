module Carto
  module Errors

    # An error for if the current user can't perform the given action.
    class NotAuthorized < InvalidRequest

      # Creates a new error with HTTP status code +403+ and the message
      # +"not authorized"+.
      #
      # @see Carto::Errors::InvalidRequest#initialize
      #
      # @return [Carto::Errors::NotAuthorized]
      def initialize
        super(status: 403, message: 'not authorized')
      end
    end
  end
end
