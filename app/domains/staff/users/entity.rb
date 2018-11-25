module Staff
  module Users
    module Entity
      def member?(organization)
        organization_id == organization.id
      end

      def apply_invitation(password)
        assign_attributes(password: password, organization_id: invited_by.organization_id)
        accept_invitation! if save
        self
      end
    end
  end
end
