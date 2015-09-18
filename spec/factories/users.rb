FactoryGirl.define do
  factory :user do
    nickname    'sakura'
    email { Faker::Internet.email }
    password { Faker::Number.number(8) }
  end
end