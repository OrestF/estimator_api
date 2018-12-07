class Task < ApplicationRecord
  include Tasks::Searchable
  include Estimation::Tasks::Entity
  include Estimation::Tasks::Validations

  has_many :report_tasks
  has_many :reports

  enum tech: Estimation::Const::TECHNOLOGIES

  def self.serializer
    ::TaskSerializer
  end
end
