class User < ApplicationRecord
  include Staff::Users::Validations
  include Staff::Users::Entity

  enum role: %i[worker manager admin]

  devise :invitable, :database_authenticatable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_and_belongs_to_many :organizations
  has_many :reports
  has_many :projects
  has_many :marks

  def self.serializer
    Staff::Users::Serializer
  end
end
