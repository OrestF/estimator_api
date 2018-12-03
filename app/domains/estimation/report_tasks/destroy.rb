module Estimation
  module ReportTasks
    class Destroy < Mutators::Destroy
      def model
        ReportTask
      end
    end
  end
end
