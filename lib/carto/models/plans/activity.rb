module Carto
  module Models
    module Plans

      # An activity plan.
      class Activity < Carto::Models::Plan
        field :description, type: String
        field :start_time, type: Carto::Fields::TimeWithNamedZone
        field :end_time, type: Carto::Fields::TimeWithNamedZone

        private

        def set_canonical_times!
          self.canonical_start = self.start_time
          self.canonical_end = self.end_time
        end
      end
    end
  end
end
