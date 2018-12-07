module Estimation
  module Reports
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :tech, presence: true
        end
      end
    end
  end
end
