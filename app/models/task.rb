class Task < ApplicationRecord
  has_many :marks
  has_many :reports

  validates :name, :tech, :user, presence: true
end
