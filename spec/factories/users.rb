FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    role 'worker'

    factory :admin do
      role { 'admin' }
    end
  end
end
