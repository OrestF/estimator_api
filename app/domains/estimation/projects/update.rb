module Estimation
  module Projects
    class Update < Mutators::Update
      def model
        Project
      end
    end
  end
end
