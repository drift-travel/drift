module Carto
  module GraphQL
    module Types
      TripType = ::GraphQL::ObjectType.define do
        name 'Trip'

        field :id, !types.String
        field :name, !types.String
        field :start_date, types.String
        field :end_date, types.String
      end
    end
  end
end
