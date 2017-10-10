module Carto
  module Models
    module Plans

      # An activity plan.
      class Activity < Carto::Models::Plan
        field :description, type: String
        field :start_time, type: Carto::Fields::TimeWithNamedZone
        field :end_time, type: Carto::Fields::TimeWithNamedZone

        private

        def set_canonical_start!
          canonical_start = start_time
          canonical_end = end_time
        end
      end
    end
  end
end
