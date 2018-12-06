class Task < ApplicationRecord
  include Tasks::Search
  include Estimation::Tasks::Entity

  has_many :report_tasks
  has_many :reports

  enum tech: Estimation::Const::TECHNOLOGIES

  validates :name, :tech, :user_id, presence: true
  validates :name, uniqueness: { scope: :tech }

  def self.serializer
    Estimation::Tasks::Serializer
  end
end
