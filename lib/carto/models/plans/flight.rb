module Carto
  module Models
    module Plans

      # A flight reservation.
      class Flight < Carto::Models::Plan

        # A flight segment.
        class FlightSegment
          include Mongoid::Document

          include Carto::Concerns::Decoratable

          def self.decorator_class
            Carto::Decorators::Plans::FlightSegmentDecorator
          end

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
          field :canonical_start, type: Carto::Fields::TimeWithNamedZone
          field :canonical_end, type: Carto::Fields::TimeWithNamedZone

          embedded_in :flight

          before_validation :set_canonical_times!

          private

          def set_canonical_times!
            canonical_start = departure_time
            canonical_end = arrival_time
          end
        end

        embeds_many :segments, class_name: 'Carto::Models::Plans::Flight::FlightSegment'

        private

        def set_canonical_start!
          canonical_start = segments.first.departure_time
        end
      end
    end
  end
end
