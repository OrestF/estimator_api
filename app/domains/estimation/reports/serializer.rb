module Estimation
  module Reports
    class Serializer < ApplicationSerializer
      identifier :id
      fields :tech, :status
    end
  end
end
