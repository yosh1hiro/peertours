FactoryGirl.define do
  factory :tour_price do
    association :tour
    number { Faker::Number.between(1, 10) }
    price { Faker::Number.number(5) }
  end
end
