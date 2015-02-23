FactoryGirl.define do
  factory :meal do
    name { Faker::Lorem.word }
    time { Faker::Date.between(2.days.ago, Date.today) }
    calories { Faker::Number.number(3) }
    association :user
  end
end