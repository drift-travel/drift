require 'spec_helper'

shared_examples_for 'decoratable' do
  let(:model) { described_class }

  describe '.decorator_class' do
    it 'references an existing class' do
      expect(defined?(model.decorator_class)).to_not eql nil
    end

    it 'references a decorator' do
      expect(model.decorator_class.ancestors).to include Draper::Decorator
    end
  end
end
