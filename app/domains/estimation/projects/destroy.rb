module Estimation
  module Projects
    class Destroy < Mutators::Destroy
      def repo
        Project
      end
    end
  end
end
