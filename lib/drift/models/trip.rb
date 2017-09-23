module Drift
  module Models

    # The main trip model.
    class Trip
      include Mongoid::Document
      include Mongoid::Timestamps

      include Drift::Concerns::Decoratable

      store_in collection: 'trips'

      field :name, type: String
      field :permalink, type: String
      field :start_date, type: Date
      field :end_date, type: Date

      validates :name, presence: true
      validates :user, presence: true

      validate :valid_date_order?

      before_create :generate_permalink!

      belongs_to :user

      has_many :plans

      private

      # Checks to ensure that the start date is before the end date
      #
      # @return [void]
      def valid_date_order?
        return if !start_date || !end_date

        errors.add(:end_date, 'before start date') if end_date < start_date
      end

      # Generates a user-friendly permalink for the trip, scoped within the
      #   user.
      #
      # @return [void]
      def generate_permalink!
        candidate = name.parameterize

        conflicts = Trip.where(user_id: user.id, permalink: candidate).count

        self.permalink =  if conflicts.zero?
                            name.parameterize
                          else
                            "#{name.parameterize}-#{conflicts}"
                          end
      end
    end
  end
end
