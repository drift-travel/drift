require 'spec_helper'

describe Drift::Decorators::Plans::FlightDecorator, type: :decorator do
  let(:decorator) { create(:flight).decorate }
end