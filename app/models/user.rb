class User < ApplicationRecord
  include Staff::Users::Validations
  include Staff::Users::Entity

  enum role: %i[worker manager admin]

  devise :invitable, :database_authenticatable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :reports
  has_many :report_tasks, through: :reports
  has_and_belongs_to_many :projects
  belongs_to :organization

  alias_attribute :estimations, :projects

  def self.serializer
    Staff::Users::Serializer
  end
end
