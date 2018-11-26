module Estimation
  module Projects
    class Destroy < Mutators::Destroy
      def model
        Project
      end
    end
  end
end
