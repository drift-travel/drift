module Carto
  module Extensions
    module Session extend self
      def registered(app)
        app.use Rack::Session::Cookie,
            secret: ENV['SESSION_SECRET'],
            expire_after: 2592000,
            domain: "carto.dev",
            httponly: false
      end
    end
  end
end
