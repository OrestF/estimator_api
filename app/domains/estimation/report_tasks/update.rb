module Estimation
  module ReportTasks
    class Update < Mutators::Update
      def model
        ReportTask
      end
    end
  end
end
