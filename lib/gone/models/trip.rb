module Gone
  module Models
    class Trip
      include Mongoid::Document

      field :name, type: String
      field :start_date, type: Date
      field :end_date, type: Date

      validates :name, presence: true

      validate :valid_date_order?

      belongs_to :user

      private

      def valid_date_order?
        return if !start_date || !end_date

        if end_date < start_date
          errors.add(:end_date, 'before start date')
        end
      end
    end
  end
end
