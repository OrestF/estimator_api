class Report < ApplicationRecord
  include Estimation::Reports::Validations

  belongs_to :user
  belongs_to :project
  has_many :report_tasks

  enum tech: Estimation::Const::TECHNOLOGIES
  enum status: %w[pending finished]

  def self.serializer
    ::ReportSerializer
  end
end
