module Carto
  module Concerns

    # Extends a user model to call an objects authorization policy to see if
    # the user is able to perform the given action on the object.
    module Authorizable
      extend ActiveSupport::Concern

      # Creates a new instance of the policy for the given object and calls the
      # given action.
      #
      # @param [Symbol] action The action to take (e.g., +:update+, +:show+).
      # @param [Mongoid::Document] object The object to check.
      # @return [Boolean] Whether the current user is authorized or not.
      def can?(action, object)
        klass = policy_class(object)
        klass.new(self, object).send("#{action}?".to_sym)
      end

      private

      # Finds the policy class for the given object.
      #
      # @return [Class] The given class.
      def policy_class(object)
        "#{object.class.to_s.sub(/Models/, 'Policies')}Policy".constantize
      end
    end
  end
end
