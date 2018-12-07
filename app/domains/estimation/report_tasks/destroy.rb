module Estimation
  module ReportTasks
    class Destroy < Mutators::Destroy
      def repo
        ReportTask
      end
    end
  end
end
