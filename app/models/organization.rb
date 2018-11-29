class Organization < ApplicationRecord
  has_many :projects
  has_many :reports, through: :projects
  has_many :users

  validates :name, presence: true, uniqueness: true

  def self.serializer
    Staff::Organizations::Serializer
  end
end
