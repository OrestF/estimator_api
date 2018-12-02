class Report < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :report_tasks

  enum tech: Estimation::Const::TECHNOLOGIES
  enum status: %w[pending finished]

  validates :tech, presence: true

  def self.serializer
    Estimation::Reports::Serializer
  end
end
