module Estimation
  module Reports
    class Destroy < Mutators::Destroy
      def repo
        Report
      end
    end
  end
end
