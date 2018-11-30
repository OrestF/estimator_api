class ReportTask < ApplicationRecord
  belongs_to :task
  belongs_to :report

  validates :optimistic, :pessimistic, :report_id, :task_id, presence: true

  def self.serializer
    Estimation::ReportTasks::Serializer
  end
end
