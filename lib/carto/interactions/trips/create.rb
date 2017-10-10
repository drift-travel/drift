module Carto
  module Interactions
    module Trips
      class Create < Carto::Interactions::Base
        object :current_user, class: Carto::Models::User
        hash :trip do
          string :name
          date :start_date, default: nil
          date :end_date, default: nil
        end

        def execute
          trip = Carto::Models::Trip.new(inputs[:trip])
          trip.user = current_user
          trip.save

          trip
        end
      end
    end
  end
end
