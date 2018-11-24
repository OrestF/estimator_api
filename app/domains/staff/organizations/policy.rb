module Staff
  module Organizations
    class Policy < ApplicationPolicy
      def index?
        user.admin?
      end

      def show?
        user.admin? || user.member?(record)
      end

      def create?
        user.admin?
      end

      def update?
        user.admin? || (user.manager? && user.member?(record))
      end

      def destroy
        user.admin?
      end

      def members?
        user.admin? || user.member?(record)
      end
    end
  end
end
