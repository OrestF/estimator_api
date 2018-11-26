FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    brief_description { Faker::Lorem.sentence }
    organization
  end
end
