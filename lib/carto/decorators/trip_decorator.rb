module Carto
  module Decorators

    # A decorator for a trip.
    class TripDecorator < BaseDecorator
      def to_hash
        attrs = super
        attrs['user_id'] = attrs.delete('user_id').to_s
        attrs
      end

      def plans_by_date
        dates = (object.start_date..object.end_date).to_a
        plans = object.plans.map { |plan| plan.decorate.to_hash }.group_by { |plan| plan['canonical_start']['time'].to_date }

        Hash[dates.map { |date| [date, []] }].merge(plans)
      end
    end
  end
end
