class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :organizations
  has_many :reports
  has_many :projects
  has_many :marks
end
