module Estimation
  module ReportTasks
    class Create < Mutators::Create
      def call
        if report.blank?
          record.errors.add(:report_id, "Report with id #{params[:report_id]} not found")
          return record
        end

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
          tech: report&.tech }
      end

      def record
        @record ||= repo.new(params.except(:name, :user_id).merge!(task_id: task.id, report_id: report&.id))
      end

      def report
        @report ||= Report.find_by(id: params[:report_id])
      end

      def repo
        ReportTask
      end
    end
  end
end
