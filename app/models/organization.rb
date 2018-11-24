class Organization < ApplicationRecord
  has_many :projects
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true

  def self.serializer
    Staff::Organizations::Serializer
  end
end
