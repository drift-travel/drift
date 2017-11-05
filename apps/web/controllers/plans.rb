module Carto
  module Web
    class Plans < Base
      get '/trips/:permalink/plans/new' do
        haml :'plans/new'
      end

      private

      def current_trip
        return nil unless params[:permalink]

        @current_trip ||= current_user.trips.where(permalink: params[:permalink]).first.decorate
      end
    end
  end
end
