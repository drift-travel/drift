module Drift
  module Models
    module Plans

      # A hotel, Airbnb, etc.
      class Lodging < Drift::Models::Plan
        field :location_name, type: String
        field :location_address, type: String
        field :location_coordinates, type: String
        field :arrival_time, type: DateTime
        field :departure_time, type: DateTime

        private

        def set_canonical_start!
          canonical_start = arrival_time
        end
      end
    end
  end
end