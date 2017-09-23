require 'spec_helper'

describe Drift::Decorators::PlanDecorator, type: :decorator do
  let(:decorator) { create(:plan).decorate }
end