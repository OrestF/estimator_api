FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
  end
end