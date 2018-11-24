module Staff
  module Users
    class Serializer < ApplicationSerializer
      identifier :id
      fields :email
    end
  end
end
