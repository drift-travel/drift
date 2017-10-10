module Carto
  module Decorators

    # A decorator for a plan.
    class PlanDecorator < BaseDecorator
      def to_hash
        attrs = attributes.clone
        attrs['id'] = attrs.delete('_id').to_s
        attrs['type'] = attrs.delete('_type').to_s.split('::').last.downcase
        attrs['trip_id'] = attrs.delete('trip_id').to_s
        attrs
      end
    end
  end
end
