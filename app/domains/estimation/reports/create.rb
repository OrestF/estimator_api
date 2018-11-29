module Estimation
  module Reports
    class Create < Mutators::Create
      def model
        Report
      end
    end
  end
end
