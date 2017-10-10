require 'spec_helper'

describe Carto::Decorators::Plans::LodgingDecorator, type: :decorator do
  let(:decorator) { create(:lodging).decorate }
end