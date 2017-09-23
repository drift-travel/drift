require 'spec_helper'

describe Drift::Decorators::Plans::ActivityDecorator, type: :decorator do
  let(:decorator) { create(:activity).decorate }
end