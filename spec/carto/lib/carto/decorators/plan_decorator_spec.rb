require 'spec_helper'

describe Carto::Decorators::PlanDecorator, type: :decorator do
  let(:decorator) { create(:plan).decorate }
end