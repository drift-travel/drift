module Carto
  module Policies

    # Trip policies.
    class TripPolicy < BasePolicy
      def show?
        user == object.user
      end

      def edit?
        show?
      end

      def update?
        show?
      end

      def destroy?
        show?
      end

      class Scope < Scope
        def resolve
          scope.where(user_id: user.id)
        end
      end
    end
  end
end