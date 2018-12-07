class Organization < ApplicationRecord
  include Staff::Organizations::Validations

  has_many :projects
  has_many :reports, through: :projects
  has_many :users

  def self.serializer
    ::OrganizationSerializer
  end
end
