module Staff
  module Organizations
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :name, presence: true, uniqueness: true
        end
      end
    end
  end
end
