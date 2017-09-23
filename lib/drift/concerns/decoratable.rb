module Drift
  module Concerns
    module Decoratable
      extend ActiveSupport::Concern

      class_methods do
        def decorator_class
          "#{to_s.sub(/Models/, 'Decorators')}Decorator".constantize
        end
      end
    end
  end
end