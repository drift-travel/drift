module Carto
  module Web
    class Sessions < Base
      get '/login' do
        haml :'sessions/new', layout: :'standalone'
      end

      post '/sessions' do
        warden.authenticate!

        unless authenticated?
          flash[:error] = 'Email or password incorrect'
        end

        redirect '/'
      end

      delete '/sessions' do
      end
    end
  end
end
