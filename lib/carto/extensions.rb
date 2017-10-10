module Carto

  # Rack extensions for the web app.
  module Extensions
  end
end

require_relative 'extensions/error_handler'
require_relative 'extensions/authentication'
require_relative 'extensions/session'
