class Project < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :users
  has_many :reports

  alias_attribute :estimators, :users

  validates :name, presence: true

  def self.serializer
    Estimation::Projects::Serializer
  end
end
