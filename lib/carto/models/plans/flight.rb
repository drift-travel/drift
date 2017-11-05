module Carto
  module Models
    module Plans

      # A flight reservation.
      class Flight < Carto::Models::Plan
        field :airline, type: String
        field :number, type: String
        field :departure_time, type: Carto::Fields::TimeWithNamedZone
        field :departure_location, type: String
        field :departure_coordinates, type: Array
        field :departure_terminal, type: String
        field :departure_gate, type: String
        field :arrival_time, type: Carto::Fields::TimeWithNamedZone
        field :arrival_location, type: String
        field :arrival_coordinates, type: Array
        field :arrival_terminal, type: String
        field :arrival_gate, type: String

        before_validation :set_canonical_times!

        private

        def set_canonical_times!
          self.canonical_start = self.departure_time
          self.canonical_end = self.arrival_time
        end
      end
    end
  end
end
