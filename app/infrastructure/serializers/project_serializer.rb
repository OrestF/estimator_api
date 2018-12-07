class ProjectSerializer < ApplicationSerializer
  identifier :id
  fields :name, :description, :brief_description

  view :with_estimators do
    association :estimators, blueprint: UserSerializer
  end

  view :with_reports do
    association :reports, blueprint: ReportSerializer
  end

  view :full do
    include_view :with_estimators
    include_view :with_reports
  end
end
