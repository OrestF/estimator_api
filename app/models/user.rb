class User < ApplicationRecord
  include Staff::Users::Validations
  include Staff::Users::Entity

  enum role: %i[worker manager admin]

  devise :invitable, :database_authenticatable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :reports
  has_many :projects
  has_many :marks
  belongs_to :organization

  def self.serializer
    Staff::Users::Serializer
  end
end
