module Estimation
  module ReportTasks
    class Update < Mutators::Update
      def repo
        ReportTask
      end
    end
  end
end
