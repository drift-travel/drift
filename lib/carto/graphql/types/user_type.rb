module Carto
  module GraphQL
    module Types
      UserType = ::GraphQL::ObjectType.define do
        name 'User'

        field :id, !types.String
        field :email, !types.String
        field :trips, types[!TripType]
      end
    end
  end
end
