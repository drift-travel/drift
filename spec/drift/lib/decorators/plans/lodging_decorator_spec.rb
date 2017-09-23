require 'spec_helper'

describe Drift::Decorators::Plans::LodgingDecorator, type: :decorator do
  let(:decorator) { create(:lodging).decorate }
end