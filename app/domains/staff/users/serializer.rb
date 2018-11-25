module Staff
  module Users
    class Serializer < ApplicationSerializer
      identifier :id
      fields :email

      view :invitation do
        fields :invitation_token
      end
    end
  end
end
