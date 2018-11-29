module Estimation
  module Reports
    class Destroy < Mutators::Destroy
      def model
        Report
      end
    end
  end
end
