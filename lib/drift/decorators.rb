require 'draper'

module Drift

  # Containing Draper decorators.
  module Decorators

    class BaseDecorator < Draper::Decorator
      delegate_all
    end
  end
end

require_relative 'decorators/user_decorator'
require_relative 'decorators/trip_decorator'
require_relative 'decorators/plan_decorator'
require_relative 'decorators/plans/activity_decorator'
require_relative 'decorators/plans/flight_decorator'
require_relative 'decorators/plans/lodging_decorator'