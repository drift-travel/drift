module Carto
  module Models

    # The parent model for all plan types.
    class Plan
      include Mongoid::Document
      include Mongoid::Timestamps

      include Carto::Concerns::Decoratable

      store_in collection: 'plans'

      field :confirmation_number, type: String
      field :canonical_start, type: Carto::Fields::TimeWithNamedZone
      field :canonical_end, type: Carto::Fields::TimeWithNamedZone
      field :canonical_location, type: Array

      validates :canonical_start, presence: true
      validates :trip, presence: true

      belongs_to :trip

      before_validation :set_canonical_times!

      private

      def set_canonical_times!; end
    end

    # Encapsulates all plan types.
    module Plans
    end
  end
end
