require 'graphql'

require_relative 'graphql/types'

module Carto
  module GraphQL
    Schema = ::GraphQL::Schema.define do
      query Carto::GraphQL::Types::QueryType
    end
  end
end
