FactoryGirl.define do
  factory :tour_category do
    association :tour
    category { Faker::Lorem.word }
  end
end
