require 'active_interaction'

module Carto
  module Interactions
    class Base < ActiveInteraction::Base
      include Carto::Models

      # Override +#run!+ for better error handling. Instead of raising
      # +ActiveInteraction::InvalidInteractionError+, raise our own invalid
      # request error with more in-depth details.
      #
      # @param [Hash] args The normal input values for the interaction.
      # @raise [Carto::Errors::NotAuthorized] Raises if current user is not
      #   authorized for this record.
      # @raise [Carto::Errors::InvalidRequest] Raises if the request goes wrong.
      # @return [self] An instance of the interaction.
      def run!(*args)
        run

        unless valid?
          if errors.messages[:current_user].include? 'not authorized'
            raise Carto::Errors::NotAuthorized.new
          else
            raise Carto::Errors::InvalidRequest.new(message: errors.details)
          end
        end

        result
      end

      private

      # Raises a not authorized error for the current user.
      #
      # @return [nil]
      def not_authorized!
        errors.add(:current_user, 'not authorized')

        return nil
      end

      # Raises a not found error for the given key.
      #
      # @param [Symbol] key Key to add the error to.
      # @return [nil]
      def not_found!(key)
        errors.add(key, 'not found')

        return nil
      end

      def merge_errors!(record)
        errors.details.merge!(record.errors.details)
        errors.messages.merge!(record.errors.messages)

        errors
      end
    end
  end
end

require_relative 'interactions/users/create'
require_relative 'interactions/users/update'
require_relative 'interactions/users/destroy'

require_relative 'interactions/trips/create'
require_relative 'interactions/trips/update'
require_relative 'interactions/trips/destroy'
