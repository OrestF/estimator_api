module Estimation
  module Projects
    class Update < Mutators::Update
      def repo
        Project
      end
    end
  end
end
