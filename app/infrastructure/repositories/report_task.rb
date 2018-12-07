class ReportTask < ApplicationRecord
  include Estimation::ReportTasks::Validations

  belongs_to :task
  belongs_to :report

  enum tech: Estimation::Const::TECHNOLOGIES

  def self.serializer
    ::ReportTaskSerializer
  end
end
