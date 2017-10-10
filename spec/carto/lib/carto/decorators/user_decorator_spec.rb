require 'spec_helper'

describe Carto::Decorators::UserDecorator, type: :decorator do
  let(:decorator) { create(:user).decorate }
end