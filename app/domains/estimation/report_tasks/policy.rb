module Estimation
  module ReportTasks
    class Policy < ApplicationPolicy
      def create?
        user.report_ids.include?(configs[:report_id])
      end

      def update?
        user.report_task_ids.include?(record.id)
      end
    end
  end
end
