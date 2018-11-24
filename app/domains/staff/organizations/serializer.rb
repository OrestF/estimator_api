module Staff
  module Organizations
    class Serializer < ApplicationSerializer
      identifier :id
      fields :name
    end
  end
end
