FactoryBot.define do
  factory :report do
    tech { Estimation::Const::TECHNOLOGIES.sample }
    status Report.statuses.keys.first
    user
    project
  end
end
