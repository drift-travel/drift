module Carto
  module Decorators

    # A decorator for a user.
    class UserDecorator < BaseDecorator
      def to_json
        Oj.dump(to_hash.slice('id', 'email'))
      end
    end
  end
end
