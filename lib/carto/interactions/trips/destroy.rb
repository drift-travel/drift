module Carto
  module Interactions
    module Trips
      class Destroy < Carto::Interactions::Base
        object :current_user, class: Carto::Models::User
        hash :trip do
          string :id
        end

        def execute
          trip = Carto::Models::Trip.find(inputs[:trip][:id])

          return not_found!(:trip) unless trip

          return not_authorized! unless current_user.can?(:update, trip)

          trip.destroy

          trip
        end
      end
    end
  end
end
