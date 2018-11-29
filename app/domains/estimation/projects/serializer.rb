module Estimation
  module Projects
    class Serializer < ApplicationSerializer
      identifier :id
      fields :name, :description, :brief_description

      view :with_estimators do
        association :estimators, blueprint: Staff::Users::Serializer
      end

      view :with_reports do
        association :reports, blueprint: Estimation::Reports::Serializer
      end

      view :full do
        include_view :with_estimators
        include_view :with_reports
      end
    end
  end
end
