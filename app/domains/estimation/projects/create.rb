module Estimation
  module Projects
    class Create < Mutators::Create
      def repo
        Project
      end
    end
  end
end
