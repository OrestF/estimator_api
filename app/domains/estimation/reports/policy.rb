module Estimation
  module Reports
    class Policy < ApplicationPolicy
      def index?
        user.manager? && user.member?(configs[:organization])
      end

      def show?
        user.reports.include?(record)
      end

      def create?
        user.manager? && user.member?(configs[:organization])
      end

      def destroy?
        create?
      end
    end
  end
end
