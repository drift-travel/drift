module Arrow
  module Models

    # The main trip model.
    class Trip
      include Mongoid::Document

      store_in collection: 'users'

      field :name, type: String
      field :start_date, type: Date
      field :end_date, type: Date

      validates :name, presence: true

      validate :valid_date_order?

      belongs_to :user

      private

      # Checks to ensure that the start date is before the end date
      #
      # @return [void]
      def valid_date_order?
        return if !start_date || !end_date

        if end_date < start_date
          errors.add(:end_date, 'before start date')
        end
      end
    end
  end
end
