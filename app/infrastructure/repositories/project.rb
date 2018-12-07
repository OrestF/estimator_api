class Project < ApplicationRecord
  include Estimation::Projects::Validations

  belongs_to :organization
  has_and_belongs_to_many :users
  has_many :reports

  alias_attribute :estimators, :users

  def self.serializer
    ::ProjectSerializer
  end
end
