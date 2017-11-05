module Carto
  module Decorators
    module Plans

      # A decorator for a flight.
      class FlightDecorator < PlanDecorator
        def to_hash
          attrs = super
          attrs['type'] = 'flight'
          attrs['description'] = "#{airline}#{number} from #{departure_location} to #{arrival_location}"
          attrs
        end
      end
    end
  end
end
