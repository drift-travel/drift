require 'spec_helper'

describe Drift::Decorators::UserDecorator, type: :decorator do
  let(:decorator) { create(:user).decorate }
end