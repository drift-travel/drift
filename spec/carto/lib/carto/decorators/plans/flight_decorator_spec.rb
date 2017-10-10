require 'spec_helper'

describe Carto::Decorators::Plans::FlightDecorator, type: :decorator do
  let(:decorator) { create(:flight).decorate }
end