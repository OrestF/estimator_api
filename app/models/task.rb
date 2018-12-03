class Task < ApplicationRecord
  include Tasks::Search

  has_many :report_tasks
  has_many :reports

  enum tech: Estimation::Const::TECHNOLOGIES

  validates :name, :tech, :user_id, presence: true
  validates :name, uniqueness: { scope: :tech }
end
