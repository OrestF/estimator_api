module Estimation
  module Reports
    class Serializer < ApplicationSerializer
      identifier :id
      fields :tech, :status

      view :with_report_tasks do
        association :report_tasks, blueprint: Estimation::ReportTasks::Serializer
      end
    end
  end
end
