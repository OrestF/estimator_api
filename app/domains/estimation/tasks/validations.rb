module Estimation
  module Tasks
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :name, :tech, :user_id, presence: true
          validates :name, uniqueness: { scope: :tech }
        end
      end
    end
  end
end
