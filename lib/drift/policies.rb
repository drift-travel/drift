require 'pundit'

module Drift
  
  # For Pundit policies.
  module Policies

    class BasePolicy
      attr_reader :user, :object

      def initialize(user, object)
        @user = user
        @object = object
      end

      def index?
        true
      end

      def new?
        true
      end

      def create?
        true
      end

      def show?
        true
      end

      def edit?
        true
      end

      def update?
        true
      end

      def destroy?
        true
      end
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope
      end
    end
  end
end

require_relative 'policies/user_policy'
require_relative 'policies/trip_policy'
require_relative 'policies/plan_policy'