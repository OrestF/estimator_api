module Estimation
  module Projects
    class Create < Mutators::Create
      def model
        Project
      end
    end
  end
end
