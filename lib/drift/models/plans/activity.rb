module Drift
  module Models
    module Plans

      # An activity plan.
      class Activity < Drift::Models::Plan
        field :description, type: String
        field :start_time, type: DateTime
        field :end_time, type: DateTime

        private

        def set_canonical_start!
          canonical_start = start_time
        end
      end
    end
  end
end
