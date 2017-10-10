module Carto
  module Policies

    # Plan policies.
    class PlanPolicy < BasePolicy
      def show?
        user == object.trip.user
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
          scope.where(:trip_id.in => user.trip_ids)
        end
      end
    end
  end
end
