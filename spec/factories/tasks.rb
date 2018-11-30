FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    tech { Estimation::Const::TECHNOLOGIES.sample }
    user_id { create(:worker).id }
  end
end
