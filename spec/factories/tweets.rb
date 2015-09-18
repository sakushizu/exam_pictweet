FactoryGirl.define do
  factory :tweet do
    image {Faker::Internet.url}
    text       'hello'
    association :user
  end
end