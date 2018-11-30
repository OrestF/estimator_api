module Estimation
  module ReportTasks
    class Policy < ApplicationPolicy
      def create?
        user.manager? && user.report_ids.include?(configs[:report_id])
      end
    end
  end
end
