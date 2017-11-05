require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/router'

require_relative 'base'

require_relative 'controllers/graphql'
require_relative 'controllers/sessions'
require_relative 'controllers/pages'
require_relative 'controllers/trips'
require_relative 'controllers/plans'

module Carto
  module Web
    class App < Base
      register Sinatra::Warden

      disable :sessions

      configure do
        set :public_folder, 'public'
        set :auth_success_path, '/'
        set :auth_failure_path, '/login'
        set :auth_login_template, :'sessions/new'
      end

      register Carto::Extensions::Session
      register Carto::Extensions::Authentication

      use Sinatra::Router do
        mount GraphQL
        mount Sessions
        mount Pages
        mount Trips
        mount Plans
      end
    end
  end
end
