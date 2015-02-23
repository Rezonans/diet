FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    daily_calories_limit { Faker::Number.number(4) }
    password 'password'
    password_confirmation 'password'

    factory :user_with_meals do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        meals_count 3
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:meal, evaluator.meals_count, user: user)
      end
    end
  end
end