module Estimation
  module Tasks
    class Policy < ApplicationPolicy
      def search?
        user.present?
      end

      def show?
        user.present?
      end
    end
  end
end
