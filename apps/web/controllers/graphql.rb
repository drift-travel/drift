module Carto
  module Web
    class GraphQL < Base
      get '/graphql' do
        Oj.dump(Carto::GraphQL::Schema.execute(params[:query]).to_h)
      end

      post '/graphql' do

      end
    end
  end
end
