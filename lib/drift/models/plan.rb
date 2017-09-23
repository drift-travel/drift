module Drift
  module Models

    # The parent model for all plan types.
    class Plan
      include Mongoid::Document

      store_in collection: 'plans'

      field :confirmation_number, type: String
      field :canonical_start, type: DateTime
      field :canonical_location, type: Array

      validates :canonical_start, presence: true
      validates :trip, presence: true

      belongs_to :trip

      before_validation :set_canonical_start!

      private

      def set_canonical_start!; end
    end

    # Encapsulates all plan types.
    module Plans
    end
  end
end
