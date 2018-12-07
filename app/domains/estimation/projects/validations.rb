module Estimation
  module Projects
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :name, presence: true
        end
      end
    end
  end
end
