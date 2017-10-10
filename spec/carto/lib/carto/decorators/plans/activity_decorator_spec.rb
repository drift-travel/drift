require 'spec_helper'

describe Carto::Decorators::Plans::ActivityDecorator, type: :decorator do
  let(:decorator) { create(:activity).decorate }
end