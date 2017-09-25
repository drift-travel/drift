require 'active_interaction'

module Drift
  module Interactions
    class Base < ActiveInteraction::Base
      include Drift::Models
    end
  end
end

require_relative 'interactions/users/create'
require_relative 'interactions/users/update'
require_relative 'interactions/users/destroy'