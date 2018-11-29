module Estimation
  module Projects
    class Policy < ApplicationPolicy
      def index?
        user.manager? || user.member?(record)
      end

      def show?
        index?
      end

      def create?
        user.manager?
      end

      def update?
        create?
      end

      def destroy?
        create?
      end

      def assign_estimators?
        create?
      end

      def remove_estimators?
        assign_estimators?
      end
    end
  end
end
