FactoryGirl.define do
  factory :tour_rule do
    association :tour
    name { Faker::Hacker.noun }
    detail { Faker::Hacker.say_something_smart }
  end
end
