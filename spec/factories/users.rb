FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    role 'worker'
    organization

    factory :admin do
      role { 'admin' }
    end

    factory :manager do
      role { 'manager' }
    end
  end
end
