module Carto
  module Interactions
    module Trips
      class Update < Carto::Interactions::Base
        object :current_user, class: Carto::Models::User
        hash :trip do
          string :id
          string :name, default: nil
          date :start_date, default: nil
          date :end_date, default: nil
        end

        def execute
          trip = Carto::Models::Trip.find(inputs[:trip][:id])

          return not_found!(:trip) unless trip

          return not_authorized! unless current_user.can?(:update, trip)

          trip.name = inputs[:trip][:name] if inputs[:trip][:name]
          trip.start_date = inputs[:trip][:start_date] if inputs[:trip][:start_date]
          trip.end_date = inputs[:trip][:end_date] if inputs[:trip][:end_date]

          trip.save

          trip
        end
      end
    end
  end
end
