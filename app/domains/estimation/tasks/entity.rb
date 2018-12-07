module Estimation
  module Tasks
    module Entity
      def avg_optimistic_mark
        report_tasks.average(:optimistic).to_f.round(1)
      end

      def avg_pessimistic_mark
        report_tasks.average(:optimistic).to_f.round(1)
      end

      def avg_marks
        avg = report_tasks.pluck('avg(optimistic), avg(pessimistic)').first
        { optimistic: avg[0].round(1), pessimistic: avg[1].round(1) }
      end
    end
  end
end
