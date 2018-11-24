class Project < ApplicationRecord
  belongs_to :organization
  has_many :users, as: :estimators
  has_many :reports

  validates :name, presence: true
end
