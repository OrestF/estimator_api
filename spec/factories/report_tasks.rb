FactoryBot.define do
  factory :report_task do
    optimistic { Faker::Number.decimal }
    pessimistic { Faker::Number.decimal }
    description { Faker::Lorem.sentences(2) }
    task
    report
  end
end
