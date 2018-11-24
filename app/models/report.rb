class Report < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks
end
