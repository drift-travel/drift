module Carto
  module Concerns
    module Decoratable
      extend ActiveSupport::Concern

      class_methods do
        def decorator_class
          "#{to_s.sub(/Models/, 'Decorators')}Decorator".constantize
        end
      end

      def decorate
        self.class.decorator_class.new(self)
      end
    end
  end
end
