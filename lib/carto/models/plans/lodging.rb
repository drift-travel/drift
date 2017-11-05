module Carto
  module Models
    module Plans

      # A hotel, Airbnb, etc.
      class Lodging < Carto::Models::Plan
        field :location_name, type: String
        field :location_address, type: String
        field :location_coordinates, type: String
        field :arrival_time, type: Carto::Fields::TimeWithNamedZone
        field :departure_time, type: Carto::Fields::TimeWithNamedZone

        private

        def set_canonical_times!
          self.canonical_start = self.arrival_time
          self.canonical_end = self.departure_time
        end
      end
    end
  end
end
