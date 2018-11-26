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
    end
  end
end
