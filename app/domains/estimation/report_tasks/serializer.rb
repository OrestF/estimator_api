module Estimation
  module ReportTasks
    class Serializer < ApplicationSerializer
      identifier :id
      fields :optimistic, :pessimistic, :description

      field :name do |report_task|
        report_task&.task&.name
      end

      field :tech do |report_task|
        report_task&.task&.tech
      end
    end
  end
end
