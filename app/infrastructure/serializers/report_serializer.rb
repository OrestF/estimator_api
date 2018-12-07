class ReportSerializer < ApplicationSerializer
  identifier :id
  fields :tech, :status

  view :with_report_tasks do
    association :report_tasks, blueprint: ReportTaskSerializer
  end
end
