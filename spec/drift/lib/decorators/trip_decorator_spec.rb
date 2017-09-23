require 'spec_helper'

describe Drift::Decorators::TripDecorator, type: :decorator do
  let(:decorator) { create(:trip).decorate }
end