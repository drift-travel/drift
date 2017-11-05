module Carto
  module GraphQL
    module Types
      QueryType = ::GraphQL::ObjectType.define do
        name 'Queries'
        description 'Query root of Carto'

        field :user, Carto::GraphQL::Types::UserType do
          argument :id, !types.ID

          description 'Find a user by id'

          resolve -> (obj, args, ctx) { Carto::Models::User.find(args['id']) }
        end

        field :trip, Carto::GraphQL::Types::TripType do
          argument :id, !types.ID

          description 'Find a trip by id'

          resolve -> (obj, args, ctx) { Carto::Models::Trip.find(args['id']) }
        end
      end
    end
  end
end
