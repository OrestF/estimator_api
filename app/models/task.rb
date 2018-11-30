class Task < ApplicationRecord
  has_many :report_tasks
  has_many :reports

  validates :name, :tech, :user_id, presence: true
  validates :name, uniqueness: { scope: :tech }
end
