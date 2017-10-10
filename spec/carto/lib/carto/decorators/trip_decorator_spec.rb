require 'spec_helper'

describe Carto::Decorators::TripDecorator, type: :decorator do
  let(:decorator) { create(:trip).decorate }
end