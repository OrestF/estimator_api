module Estimation
  module ReportTasks
    class Create < Mutators::Create
      def call
        record.save

        record
      end

      private

      def task
        @task ||= ::Task.find_by(id: params[:task_id]) || ::Task.create(task_attributes)
      end

      def task_attributes
        { name: params[:name],
          user_id: params[:user_id],
          tech: report.tech }
      end

      def record
        @record ||= model.new(params.except(:name).merge!(task_id: task.id, report_id: report.id))
      end

      def report
        @report ||= Report.find(params[:report_id])
      end

      def model
        ReportTask
      end
    end
  end
end
