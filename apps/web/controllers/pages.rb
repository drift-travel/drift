module Carto
  module Web
    class Pages < Base
      get '/' do
        haml :'pages/index'
      end
    end
  end
end
