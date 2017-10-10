require 'draper'
require 'oj'

Oj.default_options = { mode: :compat }

module Carto

  # Containing Draper decorators.
  module Decorators

    class BaseDecorator < Draper::Decorator
      delegate_all

      def to_hash
        attrs = attributes.clone
        attrs['id'] = attrs.delete('_id').to_s
        attrs
      end

      def to_json
        Oj.dump(to_hash)
      end
    end
  end
end

require_relative 'decorators/user_decorator'
require_relative 'decorators/trip_decorator'
require_relative 'decorators/plan_decorator'
require_relative 'decorators/plans/activity_decorator'
require_relative 'decorators/plans/flight_decorator'
require_relative 'decorators/plans/lodging_decorator'
