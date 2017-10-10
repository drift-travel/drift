module Carto

  # Custom error classes to throw different forms of errors on the web app.
  module Errors
  end
end

require_relative 'errors/error'
require_relative 'errors/invalid_request'
require_relative 'errors/not_found'
require_relative 'errors/not_authorized'
