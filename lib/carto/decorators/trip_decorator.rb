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
        object.plans.order('canonical_start asc').to_a
                    .flat_map { |plan|
                      case plan
                      when Carto::Models::Plans::Flight
                        plan.segments
                      else
                        plan
                      end
                    }
                    .map(&:decorate)
                    .map(&:to_hash)
                    .group_by { |plan| plan['canonical_start']['time'].to_date }
                    .tap { |dates|
                      ((start_date..end_date).to_a - dates.keys).each { |date|
                        dates[date] = []
                      }
                    }
                    .sort
                    .to_h
      end
    end
  end
end
