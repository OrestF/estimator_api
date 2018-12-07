module Estimation
  module ReportTasks
    module Validations
      def self.included(klass)
        klass.class_eval do
          validates :optimistic, :pessimistic, :report_id, :task_id, presence: true
        end
      end
    end
  end
end
