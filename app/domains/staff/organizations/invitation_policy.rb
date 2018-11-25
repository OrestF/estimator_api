module Staff
  module Organizations
    class InvitationPolicy < ApplicationPolicy
      def create?
        user.manager?
      end
    end
  end
end
