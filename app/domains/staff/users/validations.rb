module Staff
  module Users
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :email, :organization, presence: true
          validates :email, uniqueness: true
        end
      end
    end
  end
end
