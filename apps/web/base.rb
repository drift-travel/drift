require 'sinatra/reloader'
require 'sinatra/flash'

require 'haml'

module Carto
  module Web
    class Base < Sinatra::Base
      register Sinatra::Namespace
      register Sinatra::Flash

      helpers Carto::Helpers::Authentication

      Haml::Options.defaults[:escape_attrs] = false

      configure do
        # set :views, 'apps/web/views'
        set :root, File.expand_path('../', __FILE__)
        # set :sessions, true
        set :logging, true
      end

      configure :development do
        register Sinatra::Reloader

        set :reloading, true
      end

      before do
        # if !authenticated? && request.path_info != '/login'
        #   redirect '/login'
        # end
      end
    end
  end
end
