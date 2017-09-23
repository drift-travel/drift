module Drift
  module Models
    module Plans

      # A flight reservation.
      class Flight < Drift::Models::Plan

        # A flight segment.
        class FlightSegment
          include Mongoid::Document

          field :airline, type: String
          field :number, type: String
          field :departure_time, type: DateTime
          field :departure_location, type: String
          field :departure_coordinates, type: Array
          field :departure_terminal, type: String
          field :departure_gate, type: String
          field :arrival_time, type: DateTime
          field :arrival_location, type: String
          field :arrival_coordinates, type: Array
          field :arrival_terminal, type: String
          field :arrival_gate, type: String

          embedded_in :flight
        end

        embeds_many :segments, class_name: 'Drift::Models::Plans::Flight::FlightSegment'

        private

        def set_canonical_start!
          canonical_start = segments.first.departure_time
        end
      end
    end
  end
end
