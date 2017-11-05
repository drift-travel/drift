module Carto
  module Web
    class Trips < Base
      get '/trips' do
        @trips = Carto::Decorators::TripDecorator.decorate_collection(Carto::Models::Trip.all)

        haml :'trips/index'
      end

      post '/trips' do
        @trip = Carto::Interactions::Trips::Create.run!(
          current_user: current_user,
          trip: params[:trip]
        )

        redirect "/trips/#{@trip.permalink}"
      end

      get '/trips/new' do
        haml :'trips/new'
      end

      get '/trips/:permalink' do
        @trip = Carto::Decorators::TripDecorator.decorate(Carto::Models::Trip.where(permalink: params[:permalink]).first)

        haml :'trips/show'
      end
    end
  end
end
