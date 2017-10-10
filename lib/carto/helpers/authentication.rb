require 'sinatra_warden'

module Carto
  module Helpers
    module Authentication
      include Sinatra::Warden::Helpers

      def authorize!
        unauthorized! unless authenticated?
      end

      def unauthorized!
        warden.custom_failure!

        raise Carto::Errors::NotAuthorized
      end

      def current_user
        env.has_key?('HTTP_AUTHORIZATION') ? user(:api) : user
      end

      private

      # def authenticated?
      #   env.has_key?('HTTP_AUTHORIZATION') && warden.authenticate(:api_credentials, scope: :api)
      # end
    end
  end
end
