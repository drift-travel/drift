require_relative 'carto/errors'
require_relative 'carto/concerns'
require_relative 'carto/models'
require_relative 'carto/decorators'
require_relative 'carto/policies'
require_relative 'carto/extensions'
require_relative 'carto/helpers'
require_relative 'carto/interactions'
require_relative 'carto/graphql'

require_relative '../apps/web'

# The main module containing all business logic.
module Carto

  # Maps the web apps to paths.
  #
  # @return [Rack::URLMap] The map of paths.
  def self.apps
    Rack::URLMap.new(
      '/' => Carto::Web.new
    )
  end
end
