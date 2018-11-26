module Estimation
  module Projects
    class Serializer < ApplicationSerializer
      identifier :id
      fields :name, :description, :brief_description

      view :with_estimators do
        association :estimators, blueprint: Staff::Users::Serializer
      end
    end
  end
end
