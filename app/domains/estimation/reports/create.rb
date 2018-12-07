module Estimation
  module Reports
    class Create < Mutators::Create
      def repo
        Report
      end
    end
  end
end
